tell(){
	if [ $? -eq 0 ]
    then
        echo "执行成功"
    else
        echo "执行失败"
    fi
}
echo "开始杀进程,端口:"$1
kill -9 $(lsof -i:$1|tail -1|awk '"$1"!=""{print $2}')
tell

logname=log/$(date "+%Y-%m-%d-%H-%M-%S").log
mkdir log
touch $logname
jarname=$2
echo "开始部署jar包"
nohup java -jar $jarname > $logname &
tell
