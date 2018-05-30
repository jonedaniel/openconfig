## cas server deployment
1. 不需要下载完整版 cas,只需下载 [cas-overlay-template](https://github.com/apereo/cas-overlay-template).
2. 使用cas-overlay-template生成cas-server的war包,并部署在tomcat中
3. 修改C:\Windows\System32\drivers\etc\hosts文件,配置虚拟机host.
4. [配置https访问](http://blog.csdn.net/zmken497300/article/details/53186730/)
5. 找到war包中的application.properties文件配置mysql数据库.demo中已配好.
6. 创建cas客户端,引入cas-client-core,[auto-config](https://github.com/apereo/cas-overlay-template)支持,并声明cas服务端.
7. 在cas服务端使用json 声明 客户端service,在maven中添加json支持依赖.
8. cas客户端登录后跳转出现[PKIX path building failed](https://apereo.github.io/cas/5.1.x/installation/Troubleshooting-Guide.html)
9. 在client1中添加获取用户名工具类.
10. 单点登出测试
0. [Reference](https://apereo.github.io/cas/5.2.x/installation/Maven-Overlay-Installation.html)
