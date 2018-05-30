---
# Schedule
1. logout页面.
2. 登录页面修改.
3. 登陆后获取用户名.
---

---
# Navigation
1. Cas基于Spring Security配置，重点是ticket的创建与传送。参考[Security+Cas](https://docs.spring.io/spring-security/site/docs/current/reference/html/cas.html)
2. 官网的demo使用gradle 进行build，因此学习路线为 gradle -> security -> cas.
3. [boot-idea-gradle](https://github.com/jonedaniel/SSO/tree/master/bootgradledemo)
4. CAS票据: TGC,ST,PGT,PGTIOU,PT.
5. TGC用于存放用户身份认证的凭证.在浏览器与和 CAS Server间通讯时使用,并且只能基于安全通道传输,是CASServer用来确认用户身份的凭证.
6. ST: 服务票据,

## cas server deployment
1. 不需要下载完整版 cas,只需下载 [cas-overlay](https://github.com/apereo/cas-overlay-template).
2. 并使用cas-overlay-template生成cas-server的war包,并部署在tomcat中
3. [配置https访问](http://blog.csdn.net/zmken497300/article/details/53186730/)
4. 找到war包中的application.properties文件配置数据库数据源.
5. 创建cas客户端,引入cas-client-core,[auto-config](https://github.com/apereo/cas-overlay-template)支持,并声明cas服务端.
6. 在cas服务端使用json 声明 客户端service,在maven中添加json支持依赖.
7. cas客户端登录后跳转出现[PKIX path building failed](https://apereo.github.io/cas/5.1.x/installation/Troubleshooting-Guide.html)
8. [配置单点登出](https://apereo.github.io/cas/5.2.x/installation/Logout-Single-Signout.html),[service与client不是同一session](http://blog.csdn.net/eguid_1/article/details/51278622?locationNum=9),[共享session方案](http://blog.csdn.net/dodolzg/article/details/43833545),
9. 访问权限:[Service管理](https://apereo.github.io/cas/5.2.x/installation/Service-Management.html)
[配置访问策略](https://apereo.github.io/cas/5.2.x/installation/Configuring-Service-Access-Strategy.html)
---

## old cas study
---
1. 创建凭证:KaptchaUsernamePasswordCredential
2. 初始化Cookie生成器路径器: InitialFlowSetupAction. 
>> 该类自动为 CookieGenirators 设置路径. 通过常量值来防止线程安全问题
>> 此类包括5个实例变量, 两个CookieRetrievingCookieGenerator(该类用于追溯请求中的值,也用于记住我服务)
>> 其中一个是 warnCookieGenerator,一个是ticketGrantingTicketCokieGenenrator也就是比较重要的 TGT.用于票据验证
>> 另外有一个 ticketRegistry用于记录票据.一个argumentExtractors用于参数选拔. 一个 boolean pathPopulated用于标记是否设置了generators的值
>> doExecute(final Request request){};方法用于为cookie设置路径. 并将 TGTId,warnCookieValue,Service放入flowScope.
3. 授权流程,OauthAction: 成功则 发送 TGT,失败则检查TGT是否存在.
4. ticket存在检查:存在则进行 hasServiceCheck,否则进行 gatewayRequestCheck
5. gateway请求检查:如果gateway存在且service存在,进行gatewayServicesManagementCheck,否则进行serviceAuthorizationCheck
6. hasServiceCheck: if flowScope.service !=null then renewRequestCheck else viewGenericLoginSuccess
7. renewRequestCheck: if requestParameters.renew != null then serviceAuthorizationCheck else generateServiceTicket  
8. serviceAuthorizationCheck: Do a service authorization check early without the need to login first -> generateLoginTicket
9. warn: if flowScope.warnCookieValue then showWarningView else redirect 
10. passwordPolicyCheck: showWarning-> passwordServiceCheck,success->sendTGT,error->viewLoginForm
11. passwordServiceCheck: exp:sendTGTAction, passwordPostCheck
12. passwordPostCheck: if flowScope.service!=null then warnPassRedirect else pwdWarningPostView
13. warnPassRedirect: exp:generateServiceTicketAction,success:pwdWarningPostView,error:generateLoginTicket,gateway:gatewayServiceManagementCheck
14. pwdWarningAbstractView: flowScope.passwordPolicyUrl = passwordPolicyAction.getPasswordPolicyUrl
15. endState: pwdWarningPostView: casWarnPassView
16. endState: casExpiredPassView: casExpiredPassView
17. endState: casMustChangePassView: casMustChangePassView
18. endState: casAccountDisabledView: casAccountDisabledView
19. endState: casAccountLockedView: casAccountLockedView
20. endState: casBadHoursView: casBadHoursView
21. endState: casBadWorkstationView: casBadWorkstationView
22. generateLoginTicket: generateLoginTicketAction.generate(flowRequestContext) if generated then viewLoginForm
23. viewLoginForm: casLoginView username,password,vcode. exp:authenticationViaFormAction.doBind(flowRequestContext, flowScope.credentials)
24. realSubmit: exp:authenticationViaFormAction.submit(flowRequestContext, flowScope.credentials, messageContext) warn->warn,success->validatorCode,error->generateLoginTicket,accountDisabled->casAccountDisabledView,mustChangePassword->casMustChangePassView,accountLocked->casAccountLockedView,badHours->casBadHoursView,badWorkstation->casBadWorkstationView,passwordExpired->casExpiredPassView
25. sendTGT sendTGTAction serviceCheck
26. serviceCheck if flowScope.service!=null then generateServiceTicket else viewGenericLoginSucess
27. gatewayServicesManagementCheck: exp:gatewayServicesManagementCheck success:redirect
28. redirect: exp:flowScope.service.getResponse(requestScope.serviceTicketId) result:requestScope.response postRedirectDecision
29. postRedirectDecision: if requestScope.response.responseType.name() == 'POST' then postView else redirectView
30. end-state viewGenericLoginSuccess:casLoginGenericSuccessView showWarningView:casLoginConfirmView redirectView:externalRedirect:${requestScope.response.url} viewServiceErrorView:viewServiceErrorView viewServiceSssoErrorView:viewServiceSssoErrorView
31. global-transitions: 
on-exception:
viewLoginForm : UnauthorizedSsoServiceException
viewServiceErrorView : NoSuchFlowExecutionException
viewServiceErrorView : UnauthorizedServiceException

---