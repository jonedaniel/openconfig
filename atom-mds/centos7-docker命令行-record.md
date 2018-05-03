1. [VMware Workstation安装CentOS7，解决联网问题](http://blog.csdn.net/xiao714041/article/details/70241823)
2. [Linux(CentOS 7)命令行模式安装VMware Tools 详解](https://www.linuxidc.com/Linux/2017-05/143323.htm)
3. [CentOS7上安装和使用Docker](http://blog.csdn.net/kuqq2005/article/details/76359327)
4. [yum命令详解](http://man.linuxde.net/yum)
5. [CentOS7更改yum软件源](http://blog.csdn.net/neo_rat/article/details/52627749)
6. [CentOS7 64位下MySQL5.7安装与配置（YUM）](https://www.linuxidc.com/Linux/2016-09/135288.htm)
7. [linux下各目录的作用](https://www.cnblogs.com/yinheyi/p/6279974.html)
8. linux通过修改/etc/profile 配置java环境变量
9. [docker下面tomcat执行startup.sh问题](http://panyongzheng.iteye.com/blog/2243219)

---
1. CentOS-7开放端口：firewall-cmd --zone=public --add-port=8080/tcp --permanent
2. CentOS-7查看开放的端口： firewall-cmd --list-port
2. CentOS-7重启防火墙： firewall-cmd --reload
3. 创建image：  docker build -t="ubuntu/mine:tomcat" .
4. 运行image -> 创建容器: docker run -p 8090:8080 --name tomcat -v /home/data/sso/cas_deploy:/home/data/sso/cas_deploy/ ubuntu/mine:tomcat
3. docker删除容器： docker stop $(docker ps -a -q)    docker rm $(docker ps -a -q)
4. docker删除镜像: docker images  docker rmi <images id> 
5. 启动前台容器：docker run -i -t --name=docker_run centos /bin/bash
6. 启动后台容器： docker run --name=docker_run_b -d centos /bin/bash -c "this is just a test"
7. 启动之前停止的镜像： docker start docker_run     or      docker start ctn_id
8. 终止容器： docker stop [name]/[ctn_id]       or      docker kill [name]/[ctn_id]
9. 删除容器： docker rm [name]/[ctn_id]     or  docker rm 'docker ps -a -q'    "不能够删除一个正在运行的容器"
10. 挂载点，VOLUME path_name, docker run --priviledged=true -v... **必须privileged=true才能挂载！**
11. 进入容器内部： docker exec -it test /bin/bash
12. 查看容器日志： docker logs --tail 20 ctn_name
13. [nginx添加第三方模块](http://blog.csdn.net/cxm19881208/article/details/64441890)
14. [centos7下doker部署redis 报iptables错](http://blog.sina.com.cn/s/blog_53f8de0f0102x4rz.html)
15. 显示所有容器IP地址：docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
16. docker 仅使用主机网络： docker --net host
---