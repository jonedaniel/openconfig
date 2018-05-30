# web.xml

```
<web-app ** version="3.0">
<context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath*:applicationContext.xml</param-value>
</context-param>
<listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
<filter>
        <filter-name>encodingFilter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <async-supported>true</async-supported>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
</filter>
<filter-mapping>
        <filter-name>encodingFilter</filter-name>
        <url-pattern>/*</url-pattern>
</filter-mapping>
 <servlet>
        <servlet-name>contacts</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <!--<param-value>/WEB-INF/classes/spring-mvc-servlet.xml</param-value>-->
            <param-value>classpath*:/spring-mvc.xml</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
</servlet>
<servlet-mapping>
        <servlet-name>contacts</servlet-name>
        <url-pattern>/</url-pattern>
</servlet-mapping>

<welcome-file-list>
        <welcome-file>list</welcome-file>
</welcome-file-list>
```
# spring-mvc.xml

```
<import resource="classpath*:applicationContext.xml"/>
    <mvc:default-servlet-handler/>
    <mvc:annotation-driven/>
    <bean id="viewResolver" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
    <mvc:interceptors>
        <mvc:interceptor>
            <mvc:mapping path="/*"/>
            <mvc:exclude-mapping path="/login"/>
            <bean class="com._520it.web.interceptor.CheckLoginInterceptor"/>
        </mvc:interceptor>
    </mvc:interceptors>
    <bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
           <property name="maxUploadSize" value="10240000"/>
    </bean>
```
# applicationContext.xml

```
<context:component-scan base-package="com._520it"/>
<context:annotation-config/>
    <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
        <property name="basePackage" value="com._520it.mapper"/>
    </bean>
    
    <context:property-placeholder location="classpath:db.properties" system-properties-mode="NEVER"/>
    <bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource" init-method="init" destroy-method="close">
        <property name="driverClassName" value="${driver}"/>
        <property name="url" value="${url}"/>
        <property name="username" value="${username}"/>
        <property name="password" value="${password}"/>
    </bean>
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="configLocation" value="classpath:mybatis-config.xml"/>
        <property name="dataSource" ref="dataSource"/>
    </bean>
    <bean id="tx" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
        <property name="dataSource" ref="dataSource"/>
    </bean>

    <tx:advice id="txAdvice" transaction-manager="tx">
        <tx:attributes>
            <tx:method name="listAll" read-only="true"/>
            <tx:method name="get" read-only="true"/>
            <tx:method name="*"/>
        </tx:attributes>
    </tx:advice>

    <aop:config>
        <aop:pointcut expression="execution (* com._520it.*.*.*(..))" id="pc"/>

        <aop:advisor advice-ref="txAdvice" pointcut-ref="pc"/>
    </aop:config>
```
# Tomcat encoding setting

```
D:\OpenSources\Tomcat8.0\conf\server.xml
<Connector port="80" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443"
               URIEncoding="UTF-8" />
```


