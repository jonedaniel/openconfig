1. 使用 org.springframework.util.Assert 代替 if false throw new Exception
2. [CentOS 7 下安装 Nginx](https://www.linuxidc.com/Linux/2016-09/134907.htm)
3. [Nginx负载均衡配置实战](https://www.linuxidc.com/Linux/2014-12/110036.htm)
4. Nginx 一个域名映射多个端口，通过设置location /demo1，并设置 contextPath来完成！
5. Nginx 配置静态文件服务器： 查看/usr/local/nginx/conf/nginx.conf
6. 祖传地图代码
---
1. [调用1.1中的链接](http://lbs.qq.com/tool/getpoint/getpoint.html)
2. [获取目的地的ip地址](http://lbs.qq.com/tool/getpoint/getpoint.html)
3. 修改1.1链接中的相关链接：http://apis.map.qq.com/tools/poimarker?type=0&marker=coord:33.89554,114.26387;title:花木种植园;addr:河南省鄢陵县南坞镇&key=OB4BZ-D4W3U-B7VVO-4PJWW-6TKDJ-WPB77&referer=myapp
4. 将此链接放入iframe即可获取目的地周边的动态地图
---
1. [理解Cookie和Session机制](https://www.cnblogs.com/andy-zhou/p/5360107.html)
2. dubbo分布式事务:
> provider service 使用try catch 将异常封装到 resultMap返回给了 consumer。 因此Transactional 不起作用，调用的多个本地service将不会回滚。<br>
> 在catch block 中 使用 TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
---

1. [mycat在windows环境下的安装和启动](https://blog.csdn.net/smilefyx/article/details/72810531)
2. mysql的存储过程 编写。