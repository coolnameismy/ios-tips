##  Objectc 中__attribute__的用法：

__attribute是gcc中的功能，c常用，object也可以使用。


###  1：申明方法是一个弃用的方法

````objc
__attribute__ ((deprecated))

例如：
+(void)plantList:(NSString *)userId __attribute__ ((deprecated));

````


###  2: 声明反函数无返回值

__attribute__ ((noreturn)

````objc

例子：
在.h文件中申明函数：+(int)test:(NSString *)userId ;那么在.m中实现这个函数必须要返回一个int，否则编译器会报错，
若给函数加上__attribute__ ((deprecated))，则编译器会通过编译，但是有个条警告。

````


### 3：让方法在构造函数先，或后执行

````objc

写法1：__attribute__((constructor)) 
写法2：__attribute__((constructor(优先级数字))) ：注意，优先级数字要大于100，0-100是系统保留的。
写法3：先定义一个，满足声明的函数，然后在定义函数
void main_prv(void) __attribute__((constructor));

void main_prv(void)
{
    printf(" main_prv!");
}


例子，在main.m文件中，代码会在main函数之前先执行before101()，before102()，before103()，before()，并且在main函数执行后执行 after()

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

static  __attribute__((constructor)) void before()
{
    
    printf("before");
}

static  __attribute__((destructor)) void after()
{
    printf(" after!\n");
}

static  __attribute__((constructor(101))) void before101()
{
    printf(" before! 101");
}

static  __attribute__((constructor(102))) void before102()
{
    printf(" before! 102");
}

static  __attribute__((constructor(103))) void before103()
{
    printf(" before! 103");
}


````


### 4：还有很多更多的功能

[更多工具](http://gcc.gnu.org/onlinedocs/gcc-4.0.0/gcc/Type-Attributes.html)
