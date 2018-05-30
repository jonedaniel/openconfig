# spring_boot ssm项目配置
---
## spring_boot + bootstrap
---
[druid配置](http://blog.csdn.net/catoop/article/details/50925337) 
```
spring.datasource.type=com.alibaba.druid.pool.DruidDataSource
```
---
mybatis generator 只支持1.2版本的
```
 org.mybatis.spring.boot   mybatis-spring-boot-starter   1.2.0 
```
---
使用MBG报classNotFound:com... 在pom plugin中加入mysql-connc后解决.没有主键,就无法生成Mapper中ByKey类的方法
```
 <plugin>
                <groupId>org.mybatis.generator</groupId>
                <artifactId>mybatis-generator-maven-plugin</artifactId>
                <version>1.3.3</version>
                <configuration>
                    <verbose>true</verbose>
                    <overwrite>true</overwrite>
                </configuration>
                <dependencies>
                    <dependency>
                        <groupId>mysql</groupId>
                        <artifactId>mysql-connector-java</artifactId>
                        <version>5.1.30</version>
                    </dependency>
                </dependencies>
</plugin>
```
---
spring_boot中的事务管理:
在spring boot中使用注解进行事务管理,在类上声明,整个类的方法出现错误都会受影响.可以在有特殊需求的方法上再加@Transactional进行安排
```
@Transactional
@Service
public class ModelService {

    @Autowired
    private UserMapper userMapper;

    //    @Transactional(noRollbackFor = RuntimeException.class)
    public void fun2() {
        User user = new User();
        user.setPassword("222");
        user.setUsername("fun1");
        userMapper.insert(user);

        int num = 1/0;
    }
```
---
Spring Boot QQ交流群：599546061
---
Spring boot动态更新,添加dependency:

```
<dependency>  
     <groupId>org.springframework.boot</groupId>  
     <artifactId>spring-boot-devtools</artifactId>  
     <optional>true</optional>  
</dependency>  
```
---
# 通过javaBean将对象转化为map

```
List<Map<Object, Object>> maps = new ArrayList<Map<Object, Object>>();
list.stream().forEach(employee -> {
    try {
        HashMap<Object, Object> map = new HashMap<>();
        Arrays.stream(Introspector.getBeanInfo(employee.getClass(), Object.class).getPropertyDescriptors()).forEach(propertyDescriptor -> {
            try {
                map.put(propertyDescriptor.getName(), propertyDescriptor.getReadMethod().invoke(employee));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
            maps.add(map);
        } catch (Exception e) {
            e.printStackTrace();
        }
});
```
---
点击tree节点,触发onclick事件,为其绑定方法,(在方法中首先删除目标tab,然后创建tab)调用tab 的add/select方法,此tab中定义一个 datagrid,datagrid的url设置为数据源地址.
---
在linkbutton添加 iconAlign也没用,需要给外面的div加align才正确:

```
<div id="tb">
    <a href="" class="easyui-linkbutton" data-options="iconCls:'icon-ok',plain:true,iconAlign:'right'" onclick="save()">提交</a>
    <a href="" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true,iconAlign:'right'" onclick="cancel()">取消</a>
</div>
```
## easyui 的数据回显 : 基于 easyui-form

```
$("#id").form("load",jsonObj);
```
### 创建tabs时,它的根节点必须是一个 easyui-tabs元素.

```
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
        <div id="index_tabs" class="easyui-tabs" style="width:500px;height:250px;"></div>
    </div>
```


