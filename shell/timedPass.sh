# !/bin/bash
# this script displays how to use while with shell
lookport=""
maxTime=10
passedTime=0
while [[ $passedTime -lt 5 ]] && [[ $lookport == "" ]]
do
  sleep 1s
  let passedTime++
  lookport=""$(lsof -i:$1|tail -1|awk '"$1"!=""{print $2}')
  echo "已监听"$1"端口"$passedTime"秒"
done
