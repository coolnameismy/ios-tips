##  objective 和swift混搭使用

-  1:objcetive 向swift注册对象

手动在xxx-Bridging-Header.h 文字中import头文件,例如：#import "CommonOC.h"

-  2:在swift中引入objective类

-  3:在使用的object中引入文件：#import "xxx-Swift.h" 

** !!!!!!!!注意！！：1会报错2无智能感应3注意大小写 **
