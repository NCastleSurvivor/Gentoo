#!/bin/bash
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
		./docker.sh start
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
		./docker.sh stop
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
