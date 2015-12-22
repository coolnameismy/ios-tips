## 替换字符
---

````objc
#define M_PI 3.14159265358979323846264338327950288
````

## 简单函数宏
---
````objc
//定义：
#define add(a,b) a+b
//使用：
add(1,2) //打印3
````

## 复杂函数宏
---
之前的内容很容易明白了对吧，不过复杂的函数宏就没那么容易明白了。先看一下宏中的一些常用的特殊符号和系统方法

````objc
//关键字
...:可变参数
 __VA_ARGS__ :宏定义中的...中的所有剩余参数
 ##:连接符号
 #:原样输出
/:换行符

//系统工具方法
__COUNTER__ 无重复的计数器，从程序启动开始每次调用都会++，常用语宏中定义无重复的参数名称
__FILE__：当前文件的绝对路径,常见于log中
__LINE__：展开该宏时在文件中的行数,常见于log中
__func__：所在scope的函数名称,常见于log中

````

复杂宏会用到 ````#,##,...,__VA_ARGS__````等关键字和系统方法，这些关键字组合可以实现一些技巧，比如换参数和换方法名等等，多个宏结合使用，完成一些高级的功能.接下来演示的，用来获取方法参数宏(10个参数以内)

````objc
/*
获取方法参数的宏bb_argcount()
它的好处不仅将计算在预处理时搞定，不拖延到运行时的cpu；更重要的是编译检查。如某些可变参数的要求2个或3个参数，其他的都不行。只有这样的宏才能在编译前就确定参数是否满足要求
参数分类很多步骤，通过不懂的替换宏名称和参数，从而达到计算出方法参数个数的功能。
*/
#define bb_argcount(...) bb_at(10, __VA_ARGS__,10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
#define bb_at(N,...) bb_concat_at##N (__VA_ARGS__)
#define bb_concat_at10(_0,_1,_2,_3,_4,_5,_6,_7,_8,_9,...) bb_head(__VA_ARGS__)
#define bb_head(...) bb_head_first(__VA_ARGS__,0)
#define bb_head_first(first,...) first


//调用示例：
int count = bb_argcount(a,b,c,d,e);
NSLog(@" count is :%d",count);
//输出： count is :5
````

是不是很神奇？下来来一步步分析下具体如何实现的。

````objc
bb_argcount(a,b,c,d,e);//假设我们传入5个参数
````

步骤1：带入bb_argcount

````objc
//#define bb_argcount(...) bb_at(10, __VA_ARGS__,10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
//请注意...和__VA_ARGS__的使用，...是可变参数，传入的是a,b,c,d,e会替换__VA_ARGS__的部分，得到如下部分
int count = bb_at(10, a, b, c, d, e, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
````

步骤2：接下来带入bb_at

````objc
//#define bb_at(N,...) bb_concat_at##N (__VA_ARGS__)
//第一个参数为N,之后都是可变参数，所以N为10，__VA_ARGS__ 为 a, b, c, d, e, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
//##是把字符连接起来，通过##我们重新使用了新的宏,这里就是bb_concat_at10
//这一步即修改了参数，又修改了方法名
int count = bb_concat_at10(a, b, c, d, e, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
````

步骤3：带入bb_concat_at_10

````objc
//bb_concat_at10(_0,_1,_2,_3,_4,_5,_6,_7,_8,_9,...) bb_head(__VA_ARGS__)
//把前面10个参数都换了,第10位以后的参数设为可变参数
int count = bb_head(5,4,3, 2, 1)
````

步骤4：带入bb_head

````objc
//bb_head(first,...) first
//直接获取第一个数，其他的省略
int count = 5;
````

通过4步，就得到了想要的结果，是不是很神奇，很有意思？宏还有许多其他高级的用法，大家可以看一下[ReactiveCocoa](https://github.com/ReactiveCocoa)，这个库源码里的宏写的非常多，有很多很有意思的宏。


# 宏的健壮性
> 宏虽然定义和使用很简单，但是想用好，想把宏定义的健壮不出bug，却不是那么容易。

````objc
#define MIN(A,B) A < B ? A : B
````

这个宏的作用是返回小的那个数，这个宏会有什么问题？我来列出可能导致这个宏出错的几种情况

````objc
//exp1
int a = 2 * MIN(3, 4);
//exp2
int a = MIN(3, 4 < 5 ? 4 : 5);
//exp3
float a = 1.0f;
float b = MIN(a++, 1.5f);

````
为什么会出错？大家把参数带入到宏里面展开就知道了。详细展开我也不说了，大家看我下面参考中的那篇文章，里面有详细过程。

来给出系统的标准定义,看,没那么容易实现吧。

````objc
#if !defined(MIN)
    #define __NSMIN_IMPL__(A,B,L) ({ __typeof__(A) __NSX_PASTE__(__a,L) = (A); __typeof__(B) __NSX_PASTE__(__b,L) = (B); (__NSX_PASTE__(__a,L) < __NSX_PASTE__(__b,L)) ? __NSX_PASTE__(__a,L) : __NSX_PASTE__(__b,L); })
    #define MIN(A,B) __NSMIN_IMPL__(A,B,__COUNTER__)
#endif
````


##如何查看宏的展开内容？
---

如果大家看这些宏看起来很吃力的话可以用下面这个````LOG_MACRO````查看宏的内容.宏的展开顺序为先完全展开宏参数，再扫描宏展开后里面的宏，如此反复。但是，宏内容中含有#和##这两个符号的时候，参数不会被先展开。

````objc
//打印宏展开后的函数
#define __toString(x) __toString_0(x)
#define __toString_0(x) #x
#define LOG_MACRO(x) NSLog(@"%s=\n%s", #x, __toString(x))
````

##优缺点
---

宏的优点：

    -  最主要还是帮你省点事，少写点代码。
    -  实现一些高级的功能

缺点

    -  swift不支持
    -  名称没起好很容易造成歧义
    -  代码不是很易读
    -  宏没写好容易导致未知的bug


===========

参考文章：
[宏定义的黑魔法 - 宏菜鸟起飞手册](http://onevcat.com/2014/01/black-magic-in-macro/)
