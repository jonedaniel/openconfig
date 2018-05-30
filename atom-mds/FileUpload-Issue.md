---
工作:

- [x] 使用docker部署文件上传下载服务器.
* 完善项目
- 1 虚拟机安装docker
- 2 部署项目到docker
- 3 部署项目到公司服务器
- 4 使用nginx设置域名 fop_file

- [ ]  集成jar包到各个项目.

- [ ]  集成功能到已存项目


**此问题为项目分离问题,需要使用dubbo**
发现没法使用model.addAttribute() 向模板引擎添加数据.

- [x] provider不兼容fastdfs依赖
- [x] 兼容!!!  是映射路径搞错了
- [ ] 测试mvc consumer 是否可用
- [ ] 先调一下boot provider 与fastdfs的兼容
- [ ] 不兼容,则重写fastdfs.
- [ ] dubbo文件传输需要使用hessian协议 
- [ ] tomcat的内容传输没有问题,文件传输报错
- [ ] 使用hessian协议,jetty服务器,报错,原因未确定
- [ ] zookeeper未收到consumer发来的请求,原因锁定在consumer
- [ ] 用netstat测试provider是否可用
- [ ] 配置双协议 xml
- [x] consumer指定protocol失败 ? 
- [x] 转化为byte[]传播
- [ ] MultiPartFile转化为File传输
---

---
- [x] 解决:
1. 暂时无法解决consumer传输 MultipartFile
2. 方案一二同时进行.
- [ ] 方案一:
1. 建立SpringCloud的生产者消费者模型.
2. 解决MultipartFile传输问题
3. 建立一个SpringMvc项目,引入cloud相关依赖
4. 公司内网测试<引入api层与eureka测试效果> 

- [x] 方案二:
1. 在前端将MultipartFile转化为byte[].
2. 在springboot将业务写完 
3. 搭建springMVC项目,跑通dubbo. 
> 现在要尝试
4. 公司内网测试↓ 周一.
---

---
1. 使用dubbo在公司服务器进行服务注册. 周一
2. 设计一套前端页面,周二
3. 完善业务逻辑,周三
5. 异常设计,代码完善,周四
> 业务优先,加入是否可以提交的判断.
> 抛出异常前端显示弹窗,logger的使用
6. 整体测试,周五
---
new plan:
不使用微服务,打jar包,调service接口.


---
### 需求完善
1. 识别当前平台?  在logger中打出 

2. 使用uploadifive完成前台文件上传
3. 删除后台webinf中无关文件
4. 前端异常，留给整合到的工程里去做
5. 后台做一个多选删除.
6. 前台 重复上传无反应
---

# 一天一个就够了