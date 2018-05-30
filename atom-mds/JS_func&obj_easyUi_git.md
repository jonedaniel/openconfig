# function
---
1. js函数的重载
2. java: "hello".sout()可以直接打印.  js: "hello".log() eq to console.log("hello")
3. 在chrome console中可以直接输入来debug,还可以在snippets进行js编程.
4. arguments.callee 表示当前方法,方法调用自身,可以用arguments.callee()
5. 在js中,对象的本质是一堆属性的集合,所有对象克隆就是用for循环copy全部属性
6. 原型链就是将子类的 prototype赋值为父类对象,当a对象的prototype是b对象时,a instanceof B = true
---

# easyUI
---
1. $.parseJSON的用法:
2. panel(工具栏),linkbutton,window,dialog
3. 第二个项目会用到,Toolbar(框顶按钮) and Buttons(框底按钮) 
4. easyui-panel 不能在tools中加入icon-add..等图标,只能加入属性,属性自带图标
- [x] 属性名是toolbar 不是tools

```
<div class="easyui-panel"
     data-options="width:500,height:200,iconCls:'icon-save',collapsible:true,maximizable:true,minimizable:true,closable:true"
     title="myPanel">this is the panel
</div>
```
5. tools :"#id" 没有效果的原因是:若要加入tools或者buttons, 该dom对象的text必须为空.

```
<div class="easyui-panel" style="width:300px;height:200px"
		title="My Panel" data-options="iconCls:'icon-ok',tools:'#tt'">
</div>
<div id="tt">
	<a href="#" class="icon-add" onclick="javascript:alert('add')"></a>
	<a href="#" class="icon-edit" onclick="javascript:alert('edit')"></a>
</div>

```
6. message window:

```
$.messager.alert("title","content","icon");
$.messager.confirm()
```

#easy ui

---
1. 作业datagrid 修改后提交.
2. datagrid columns :[[{},{}],[],[]],最外面的中括号代表的是thead的配置,括号内有括号代表 可以有多个thead.
---
# 建立一个git项目,主题:java学习记录.
---
# git
---
1. 提交更新: git commit -m "添加文件file2.txt" file2.txt (必须加m注明更改的内容.) 也可以git commit -m "..." 提交全部暂存区内容.此时工作区的修改,必须被add.  1)提交所有文件: git commit -a -m "..." 2)
2. 查看日志: git log   or  git log --pretty=oneline
3. git status
4. 比较文件,显示修改过的地方:  git diff fileName.txt -> 比较暂存区与工作区文件的不同.
5. 查看git版本: git reflog
6. 回退到上一版本: git reset --hard HEAD^ || 回退到100个之前的版本: git reset --hard HEAD~100 ||git reset --head (指定版本.. git reflog的第一个值)
7. 修改文件后,在bash中输入git add,此时可以不提交而继续修改,修改n次后 git commit -m "..." file 提交 -> 修改是在工作区,add将修改后的文件放入暂存区,commit提交暂存区的修改,并清空暂存区.
8. git checkout -- * 可以丢弃工作区的修改. ||让这个文件回到最近一次git commit或git add时的状态 -> 文件的修改 add之后被放入暂存区,此时回退只能回退到放入暂存区后的状态 -> 也就是只能取消add之前的修改,add之后的修改,撤销不了.
9. rm file , 删除后此文件直接消失.
---
## git branch
---
1. git branch  显示所有分支.
2. git branch <name>  创建分支<name>
2. git checkout <name> 切换分支到<name>
3. git checkout -b <name> 创建并切换到分支<name>
4. git merge <name> 合并<name>分支到当前分支
5. git branch -d <name> 删除<name>分支
6. commit your changes or stash them before you can switch branches.(如果在当前分支,有修改,切换分支之前必须提交)
---
## git push 推送当前proj到服务器.
## git pull 将服务器更新当前proj
--
在项目目录. git init 
vi .gitignore : 
.git
.idea
target
WMS.iml
.ignore
-> 只留 .gitignore,pom.xml,src/  
git add pom.xml src/
git remote add origin git@192.168.113.47:heshengjun/wms.git
git push -u origin -
...
到需要目录: git clone .../proj 

