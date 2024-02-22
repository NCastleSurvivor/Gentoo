#!/bin/bash
defaultList=(redis nginx mysql)
#赋初始值
serverList=${defaultList[*]}
#获取当前脚本名称
SCRIPT_NAME=$(basename "$0")
# 定义报错返回字符串
STR_ERROR="格式：${SCRIPt_NAME} [start|restart|stop] ..."
if [ $# -lt 1 ]; then
	echo "参数错误"
	echo ${STR_ERROR}
	echo 8
fi
if [ $# -eq 1 ]; then
	if [ $1 != "start" -a $1 != "restart" -a $1 != "stop" ]; then
		echo "参数错误"
		echo ${STR_ERROR}
		exit 8
	fi
fi

case "$1" in
start)
	# 检查服务是否运行
	allNum=$(ps -ef | grep docker | grep -v 'grep' | wc -l)
	if [ $allNum -ge 1 ]; then
		echo "docker服务正在运行"
	else
		echo "docker服务未启动"
		systemctl start docker docker.service 
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
		# 校验服务是否启动
		run=$(ps -ef | grep docker | grep -v 'grep' | wc -l)
		if [ $run -ge 1 ]; then
			echo "docker启动成功"
		else
			echo "docker启动失败！原因：未知错误，请排查！"
		fi
	fi
	;;

stop)
	echo "正在停止服务。。。"
	echo "=================="
	#检查服务数量
	runNum=$(ps -ef | grep docker | grep -v 'grep' | wc -l)
	if [ $runNum -eq 0 ]; then
		echo "docker服务未启动，无需停止"
	else
		echo "正在停止服务..."
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
		done
    	echo ""
		echo "==============="
		echo "docker容器已全部关闭"
		echo ""
		echo "正在停止docker服务"
		echo "==============="
		systemctl stop docker.socket docker docker.service
		sleep 1s
		runNum_new=$(ps -ef | grep docker | grep -v 'grep' | wc -l)
		if [ $runNum_new -eq 0 ]; then
			echo "docker服务已关闭"
		else
			echo "docker服务关闭失败！未知原因，请检查！"
		fi
		echo ""
	fi
	;;

restart)
	sh $0 stop
	echo "====即将重启docker服务===="
	sleep 1.5s
	sh $0 start
	;;
esac
