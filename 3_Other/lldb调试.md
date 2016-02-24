````
n/next：step over；
s/step：step into；
finish：step out；
c/continue：goto next breakpoint；
expr/expression：Evaluate a C/ObjC/C++ expression（动态执行C/ObjC/C++表达式）；
p/print/expr/expression：print as a C/C++ basic variable；
po/expr -O/expression -O：Print as an Objective-C object；
call：调用。其实上述p/po后接表达式(expression)也有调用的功能，一般只在不需要显式输出，或是无返回值时使用call，用于动态调试插入调用代码。
bt（backtrace），打印当前调用堆栈（crash堆栈），“bt all”可打印所有thread的堆栈（相当于command+6的Debug Session Navigation）。
image：可用于寻址，有多个组合命令，比较实用的一种用法是寻找栈地址对应的代码（行）位置。

````

参考页面：http://www.cocoachina.com/ios/20141225/10761.html