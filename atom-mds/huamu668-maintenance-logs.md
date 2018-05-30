1. netstat -ntlp  查看所有端口占用
2. nohup java -jar jarName.jar >jarName.jarName.txt &  jar包不挂起后台运行 日志输出到当前目录jarName.txt  [Linux jar包 后台运行](http://blog.csdn.net/qq_30739519/article/details/51115075)
3. netstat -nlp |grep :9181 查看某端口占用的线程的pid
4. jobs：查看任务，返回任务编号n和进程号 ， bg  %n  将编号为n的任务转后台运行 ，fg  %n   //将编号为n的任务转前台运行 ， ctrl+z    //挂起当前任务 ， ctrl+c    //结束当前任务