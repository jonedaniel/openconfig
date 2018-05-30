# wms-10/18
**不要自己找bug,学习为主,5分钟找不到答案,就去找到答案,并重复敲多遍记忆,bug比你想的要多,找到答案,而不是自己想**
## wms refactor
1.还是没有不理解什么情况下用额外sql,什么情况下使用内联查询
(能使用额外sql,集不要使用内联查询)
---

2.代码格式整理.


---
- [x] 部门批量删除√(逻辑错误:加上判断id是否为null) 
- [x] 员工批量删除√(写错字 ids)
- [x] 员工添加 √(传的是department id,不是 de* 对象)
- [x] **admin 添加**
(admin(checked属性)没有传值,需要改成
```
//以下未能解决
$(":input[type='checkbox']").prop("checked", 
//经此解决
${emp.admin?true:false});
 $("#admin").change(function () {
            if ($("#admin").attr("checked") == "checked") {
                $("#admin").val(true);
            } else {
                $("#admin").val(false);
            }
```
- [x] 所属部门的回显(少写js)
- [x] menu子菜单添加不显示parent(url与input value值)
---
- **@ModelAttribute() 用法**
1. 咋就给忘了呢,@ModelAttribute() 省略了 addAttr..(),懂了吗?
---
- [x] list不显示parent不为null的菜单,qo.parentId设置为0,然后
```
<if test="parentId>=0">
    ifnull(parent_id,0) = #{parentId}
</if>
```
- [x] input 显示父菜单,单独传parentId解决
```
    public String input(Model model,Long id,Long parentId) {
        if (id!=null){
            model.addAttribute("systemMenu", systemMenuService.get(id));
        }
        if (parentId == null) {
            model.addAttribute("parentName", "根目录");
        }else{
            model.addAttribute("parentId", parentId);
            model.addAttribute("parentName", systemMenuService.get(parentId).getName());
        }
        return "systemmenu/input";
    }
```
- [x] sm根目录不能新增 √(奇葩问题 input submit)
- 
```
<input type="submit" value="确定保存" class="ui_input_btn01"/>
```

- [x] 角色保存问题√(serviceImpl 接收的数组没有处理好)
- [x] **map与对象的替代,在mappper.xml中需要转化缩写**
```
 @Override
    public List<Map<Object, Object>> loadMenusByParentSn(String parentSn) {
        List<SystemMenu> list = mapper.selectMenusByParentSn(parentSn);
        ArrayList<Map<Object, Object>> maps = new ArrayList<>();
        HashMap<Object, Object> map = new HashMap<>();
        for (SystemMenu sm : list) {
            map.put("id", sm.getId());
            map.put("name", sm.getName());
            map.put("pid", sm.getParent().getId());
            map.put("action",sm.getUrl());
            maps.add(map);
            map = new HashMap<>();
        }
        return maps;
    }
    @Override
    public List<Map<Object, Object>> queryMenuByParentId(String parentId) {
        return mapper.selectMenuByParentId(parentId);
    }
    
    <select id="selectMenuByParentId" resultType="map">
        SELECT id,name,url as action,parent_id as pId
        from systemmenu
        where parent_id = #{parentId}
    </select>
```
- [x] index.js 异步加载zTree 出现bug不能加载√(async传递的函数设置不正确)  
在调试参数相关时,直接在浏览器网址栏输入参数比较容易发现问题:<br>
http://localhost/systemmenu/loadMenu?parentId=null
```
var setting = {
    data: {
        simpleData: {
            enable: true
        }
    },
    callback:{
        onClick:function(event,treeId,treeNode){
            if (treeNode.action){
                $("#rightMain").prop("src","/"+treeNode.action)
                $("#here_area").text("当前位置:"+treeNode.name)
            }
        }
    },
    async:{
        enable:true,
        url:"/systemmenu/loadMenu",
        //loadMenu传递的参数应该为pid
        autoParam:["sn=parentSn"]
    }
    /*
    //修改为此数后正确
      async:{
        enable:true,
        url:"/systemmenu/loadMenu",
        autoParam:["id=parentId"]
    }
    */
};
```

 # wms~10-19 course
---
1. 注意参数传递时的几个检验关口.
2. 单据查明细使用内联查询
3. 搜索下chrome下好用的web 开发plugin
4. 加http:可以访问外网页面,而不受类名上的map限制.
5. ajaxForm的使用
6. jquery寻找最近父元素 closest
7. 在多个相同的标签中find特殊标签,可以给该标签加属性,然后使用属性选择器进行选择.
8. parseFloat,parseInt在遇到不合格数据时,停止转化,但不报错
9. on jquery绑定一个或者多个事件(使用clone(true))性能下降
10. 时间选取可以使用my97,时间回显要是用fmt.
11. status在数据库中时0和1,在页面显示文字.不建议在前台加判断,应该在domain中加getter来获取该状态,前后台功能分离
12. window.history.back()
13. 复习第二阶段js.(忘光)
14. 取消拦截器!!!
---
- [] password变成null
- [] orderbill使用分离的save upload why√(业务负责)
- [x] B页面query后无法添加到A页面(使用dialog对话框,B页面向A页面传递消息,在input加 data-url属性写jon字符串时,忘记加引号)
# wms~10-20 course

---
==jstl 的foreach循环,写错了位置,花了一天时间才找到.bug表现就是编辑页面无法删除==<br>
++所以不要想着速度,==速度就等于bug==,一步一步来,走好每一步++

---
1.CTRL+h 搜索整个项目
# wms-10-21
- [x] 在mapper中使用collection必须使用ofType,否则报错,浪费20分钟.
# wms-10-22
---
1. shiro权限管理(分组)
2. 微信公众号(4天)
3. 电商后台()
---
1. 库存价格使用(移动加权平均算法)
2. 事务相当于在方法外价格一个try-catch,出现异常则回滚事务,Spring使用AOP达成,默认的回滚异常时runtimeException
3. stockincome/outcome bill 状态使用public static final int 表示.
4. idea 清除所有断点方式.

# wms-10-23
---

1.销售报表
2. echarts 图表插件
3. 使用json可以将后台逻辑计算结果传送到前台.
4. 不应再在简单重复劳动上面浪费自己时间
5. 使用seriable将form提交的数据转换为 一段url(?之后的)
6. 准备简历(罗列使用到的相关技术)
7. Linux下 idea的安装
```
 <div align="right">
                        <input type="button" value="柱状图表" class="ui_text_lt chart" style="background-color: green;" data-url="/chart/saleChartByBar">
                        <input type="button" value="饼状图标" class="ui_text_lt chart"
                               style="background-color: greenyellow;" data-url="/chart/saleChartByPie">
                    </div>
                    <script type="text/javascript">
                        $(function () {
                            $(".chart").click(function () {
                                var url = $(this).data("url")+"?"+$("#searchForm").serialize()
                                $.dialog.open(url,{
                                    width:500,
                                    height:500,
                                    cancel:true
                                })
                            })
                        })
                    </script>
```