logname=$(date "+%Y-%m-%d-%H-%M-%S").log
touch $logname
jarname=$1
nohup java -jar $jarname >$logname
