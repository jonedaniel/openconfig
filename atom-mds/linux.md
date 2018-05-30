#linux day01
---
1. 项目部署: 打包 maven,clean,install
2. netcraft: 显示网站跑在什么服务器上面
3. emac编辑器.
4. 隐藏文件以.开头
5. 以/开头的是绝对路径,不以/开头的是相对路径.
6. ifconfig查看ip地址,自己配置ip地址与dns server
7. top 显示任务管理器,主要关注内存
8. history显示命令输入历史.
9. 使用tab键进行代码补全.
10. cat查看文本内容.vi or touch create a new file
11. 使用useradd username -> cat /etc/passwd -> userdel -r username -> cat /etc/passwd
12. groupadd groupname -> cat /etc/group -> groupdel groupname 用户组在home下无文件夹
13. useradd -g username groupname 指定用户组.
14. 文件:计算机资源 属主 属组 其他用户.
15.  rwxr-xr-x  rwx:属主的权限,属组的权限,其它用户的权限. 可以用一个9位的二进制数表示,然后 每3位 转化成10进制数. 
16.  chmod 777 xx.xx . 修改当前用户对 xx.xx的权限为 777 -> 111111111 -> rwxrwxrwx .  
17.  chmod +x xx.xx 给所有用户(未指定)添加执行权限.
18.  chmod -R xx.xx 所有子目录添加某权限.
19.  切换用户 su userName
### vi
1. 编辑模式,末行模式,插入模式
2. ctrl + f 编辑模式下,翻页下一页
3. ctrl + b 编辑模式下,翻页前一页
4. 在插入模式下,yy复制某一行,p粘贴那一行,dd删除某一行
5. 查找:在编辑模式下,按/*, *为要找的内容,然后按n找下一个内容
6. %s/f/F/gi 文件内容替换
7. tail fileName 从最后几行开始显示tomcat内容
8. grep xxx fileName 显示xxx所在行
9. grep -n -b 2 xxx fileName 显示xxx所在的行及前后2行
10. rm -r xx 递归删除 -> 删除该文件/夹所有子文件
### ??
1. 打包: tar -cvf xxx.tar xxx, c create v verbose f 文件名.
2. 解压: tar -xvf xxx.tar
3. 打包+压缩: tar -zcvf test.tar.gz test
4. 解压:  tar -zxvf test.tar.gz
### 网络管理:
ip: 子网掩码:用来区分网络地址和主机地址 网关:在不同网段之间的计算机进行通信的时候,就需要依赖网关
防火墙 vi /etc/sysconfig/iptables

# linux day02
---
1. /etc 用于存储常用的配置文件
2. 查询某个进程: ps -ef|grep mysql
3. ping 
4. 查看环境变量: env ; 过滤目标: env |grep jdk
5. find /etc -name 'mysql'
---
1. rpm :redhat package management , RPM is package Management linux安装软件的工业标准. deb 用于ubuntu安装软件
2. 安装软件: rpm -ivh softName
3. 卸载软件: rpm -e softName ; 强制卸载: rpm -e --nodeps softName
4. 查询已安装软件: rpm qa|grep xxx
- [] 缺点:需要手动解决安装包依赖关系 -> 用yum前端软件包管理器解决
-  yum install ; yum remove; yum list |grep softName;yum list installed|grep softName
---
开启tomcat服务器: 1. cd /usr/local/bin ; ./started.sh 察看日志: tail -100f catalina.out 
默认端口8080,想要访问还需要在防火墙打开8080端口: 
---
# linux day03 exercise
---