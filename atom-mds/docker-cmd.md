1. CentOS-7开放端口：firewall-cmd --zone=public --add-port=8080/tcp --permanent
2. CentOS-7重启防火墙： firewall-cmd --reload
3. docker删除容器： docker stop $(docker ps -a -q)    docker rm $(docker ps -a -q)
4. docker删除镜像: docker images  docker rmi <images id>
5. 启动前台容器：docker run -i -t --name=docker_run centos /bin/bash
6. 启动后台容器： docker run --name=docker_run_b -d centos /bin/bash -c "this is just a test"
7. 启动之前停止的镜像： docker start docker_run     or      docker start ctn_id
8. 终止容器： docker stop [name]/[ctn_id]       or      docker kill [name]/[ctn_id]
9. 删除容器： docker rm [name]/[ctn_id]     or  docker rm 'docker ps -a -q'    "不能够删除一个正在运行的容器"
