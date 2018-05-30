1. 函数的参数之关键字参数：  def printkeywords(name="zmh",**words):  print(name,":",words)                     printkeywords("menghui",age=25,salary=11,hope="still",time="limit")
2. 函数的默认参数必须只想不变对象： def add_end(L=None):    if L is None:   L = []  L.append('END') return L
3. # 事实上尾递归和循环的效果是一样的，所以，把循环看成是一种特殊的尾递归函数也是可以的。
# 尾递归是指，在函数返回的时候，调用自身本身，并且，return语句不能包含表达式。这样，编译器或者解释器就可以把尾递归做优化，使递归本身无论调用多少次，都只占用一个栈帧，不会出现栈溢出的情况
def fact(n,sum=1):if n == 1:return sum    return fact(n-1,sum*n）
4. 