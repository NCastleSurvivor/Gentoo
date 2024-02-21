#!/bin/bash
defaultList=(redis nginx mysql)
# 获取当前脚本名称
SCRIPT_NAME=$(basename "$0")
#赋初始值
serverList=${defaultList[*]}
#定义参数错误字符串
STR_ERROR="格式:${SCRIPT_NAME} [start|restart|stop] [keywords...]"
#参数校验
if [ $# -lt 1 ]; then
    echo "参数错误！"
    echo ${STR_ERROR}
    exit 8
fi
if [ $# -eq 1 ]; then
    if [ $1 != "start" -a $1 != "restart" -a $1 != "stop" ]; then
        echo "参数错误"
        echo ${STR_ERROR}
        exit 8
    fi
else
    serverList=${*:2}
fi



case "$1" in
start)
  echo "正在启动服务......"
  echo "================"
  for i in ${serverList[@]}; do
    #检查容器数量
    allNum=$(docker ps -a --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | wc -l)
    if [ $allNum -eq 0 ]; then
      echo $i"启动失败！原因：服务不存在,可执行以下命令查看详情！"
      echo 'docker ps -a --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep '$i
    elif [ $allNum -gt 1 ]; then
      echo $i"启动失败！原因：存在2个以上容器,请确保关键字唯一,可执行以下命令查看详情！"
      echo 'docker ps -a --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep '$i
    else
      #输出容器名称
      runNameNew=$(docker ps -a --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | awk '{ print $3}')
      #检查是否启动
      runId=$(docker ps --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | awk '{ print $1}')
      if [ "$runId" == "" ]; then
        docker start $(docker ps -a --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | awk '{ print $1}')
        sleep 1s
        #校验是否成功启动
        runNum_new=$(docker ps --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | wc -l)
        if [ $runNum_new -eq 1 ]; then
          echo $runNameNew"启动完成"
        else
          echo $runNameNew"启动失败！原因：未知错误！"
        fi
      else
        echo $runNameNew"已启动,无需重新启动"
      fi
    fi
    echo ""
  done
  echo "================"
  echo "服务启动完成......"
  ;;



stop)
  echo "正在停止服务......"
  echo "================"
  for i in ${serverList[@]}; do
    #检查容器数量
    runNum=$(docker ps --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | wc -l)
    if [ $runNum -eq 0 ]; then
      echo $i"未启动,不用停止"
    elif [ $runNum -gt 1 ]; then
      echo $i"停止失败！原因：存在2个以上运行容器,请确保关键字唯一,可执行以下命令查看详情！"
      echo 'docker ps --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep '$i
    else
      #输出容器名称
      runNameNew=$(docker ps --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | awk '{ print $3}')
      docker stop $(docker ps --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | awk '{ print $1}')
      sleep 1s
      #校验是否停止成功
      runNum_new=$(docker ps -a --format "table {{.ID}} {{.Image}} {{.Names}} {{.Ports}}" | grep $i | wc -l)
      if [ $runNum_new -eq 1 ]; then
        echo $runNameNew"已停止"
      else
        echo $runNameNew"停止失败！原因：未知错误！"
      fi
    fi
    echo ""
  done
  echo "================"
  echo "服务停止完成......"
  ;;


restart)
  #$0表示文件本身
  #$@传递输入参数:2从第二个起
  sh $0 stop ${serverList[*]}
  echo "===即将重新启动==="
  sleep 1.5s
  sh $0 start ${serverList[*]}
  ;;
esac