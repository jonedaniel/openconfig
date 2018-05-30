# wms-10/18
**不要自己找bug,学习为主,5分钟找不到答案,就去找到答案,并重复敲多遍记忆,bug比你想的要多,找到答案,而不是自己想**
## wms refactor
1.还是没有不理解什么情况下用额外sql,什么情况下使用内联查询

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
- [x] password变成null (没写password回显)
- [-] 动态载入zTree不显示(清除缓冲后解决)
- [] menu子菜单添加回显父菜单()