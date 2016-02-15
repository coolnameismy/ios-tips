 NSLog的格式如下所示：

````objc

%@     对象
%i     整数
%d,    double
%u     无符整形
%f     浮点/双字
%x, %X 二进制整数
%o     八进制整数
%zu    size_t
%p     指针
%e     浮点/双字 （科学计算）
%g     浮点/双字 
%s     short 
%.*s   Pascal字符串
%c     字符 char
%C     unichar
%lld   64位长整数（long long）
%llu   无符64位长整数
%Lf    64位双字
%zu	   size_t

%#     A class object (Class)
%:     A method selector (SEL)


````

打印百分号： ````%%````

-	[参考链接](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100-SW1)