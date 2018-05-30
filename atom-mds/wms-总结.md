# js
1. checkBox与select option的回显:使用
```
$("#id option[value=${qo.key}]").prop("",true)
```
2. $("#formId").serialize()可以将form中要提交的url片段 转换成 字符串,加入 data-url中,在ajax请求中传入后台.

```
 var url = $(this).data("url")+"?"+$("#searchForm").serialize()
```

3. 使用$("#id").on(event,selector,function()).on(event,selector,function())
 定义的节点 在被复制时可以被复制走 节点上所带有的事件.
4. 使用$("#id").each(function(index,value){...})可以遍历选定节点.index表示节点数组下标,value表示该index对应的数组元素.
```
 $(".btn_submit").click(function () {
                                    $("#edit_table_body tr").each(function (index, val) {
                                        $(val).find("[tag=pid]").prop("name", "items[" + index + "].product.id")
                                        $(val).find("[tag=remark]").prop("name", "items[" + index + "].remark")
                                        $(val).find("[tag=number]").prop("name", "items[" + index + "].number")
                                        $(val).find("[tag=costPrice]").prop("name", "items[" + index + "].costPrice")
                                    })
                                    $("#editForm").ajaxSubmit(function (data) {
                                        if (data.success) {
                                            $.dialog({
                                                name: "温馨提示",
                                                content: "操作成功",
                                                ok: function () {
                                                    window.location.href = "/stockincomebill/list";
                                                }
                                            })
                                        }
                                    })
                                })
```
5. 使用$("#formId").ajaxForm(function(data){...})可以不用按钮,直接提交表,function(data){}用于接收后台返回json数据
6. 使用artDialog创建对话框,要引入artDialog jsquery插件与iframe插件.在A页面使用$.dialog.open(url,{})
在B页面使用$.dialog.data("json",json);$.dialog.close()传递json数据到A页面
7. 使用map遍历集合得到一个数组
```
var arr = $(".acb:checked");
  var ids = $.map(arr, function (item) {
            return $(item).data("ids");
        })
```
