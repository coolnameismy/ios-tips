## ````#program常用标识 ````

##  1：注释代码段
--- 

````
#program mark -[注释内容]
说明：用于注释内容
#program mark 是每个ios程序员都必须会用的技巧，通过#program mark 把代码分为个个部分，良好的注释是好代码的开始
````

## 2：取消xcode编译器内对于启用方法的警告
--- 
 
````
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  // 这段中出现使用所有的弃用方法都不会产生告警       
#pragma clang diagnostic pop

````

##  3：取消对未使用变量的警告，使用法师和2相同，必须成对出现#pragma clang 
--- 

````
diagnostic ---
#pragma clang diagnostic ignored "-Wunused-variable"   

====================
#warning :手动产生一条告警
#error : 手动产生一条错误
````

还有种方式也能达到同样效果

````
 #pragma unused (foo)

````

##  4: 忽略内存泄露告警
--- 

````
#pragma clang diagnostic push 
#pragma clang diagnostic ignored "-Warc-performSelector-leaks" 
   [someController performSelector: NSSelectorFromString(@"someMethod")]
#pragma clang diagnostic pop
````