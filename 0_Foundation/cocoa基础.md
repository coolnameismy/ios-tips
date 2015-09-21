### 类别的使用例子

````objc
#import "Roommate.h"
@interface Roommate (Roommate_Say)
-(void) introduceSelf;
//-(void)hello:(NSString *) str;
@end

#import "Roommate+Roommate_Say.h"
@implementation Roommate (Roommate_Say)
-(void) introduceSelf{   
    NSLog(@"my name is liuyanwei");
}
@end

````
### 协议的使用例子

````objc
#import <Foundation/Foundation.h>
@protocol RoommateDelegate<NSObject>
@optional
-(void)showMessage:(NSString *)msg;
@required
-(void)mustShowMessage:(NSString *)msg;
@end

````

## block的使用

````objc

--1基本用法
 void(^myblock)(NSString *msg) = ^(NSString *msg){
        NSLog(@"%@",msg);
    };    
    myblock(@"hello");

--2先定义在类方法中后使用
//方法定义
-(void)showMessageWithBlock:(NSString *) msg block:(void (^)(NSString *msg))block
{
    block(msg);
}

//方法定义的简写
typedef void (^ShowMessageBlock)(NSString *msg);
-(void)showMessageWithBlock1:(NSString *) msg block:(ShowMessageBlock)block{
    block(msg);
}
//方法的使用
[roommate showMessageWithBlock:@"hello" block:^(NSString *msg) {
        NSLog(@"%@",msg);
}];

--3 注意点
若想在block中修改本地变量，需要声明变量类型： __block NSString *localmsg = @"local string";

````

## 结构体

````objc
/*NSRange表示一个范围*/
void test1(){
    NSRange rg={3,5};//第一参数是起始位置第二个参数是长度
    //NSRange rg;
    //rg.location=3;
    //rg.length=5;
    //NSRange rg={.location=3,.length=5};
    //常用下面的方式定义 NSRange rg2=NSMakeRange(3,5);//使用NSMakeRange定义一个NSRange 
    //打印NSRange可以使用Foundation中方法 NSLog(@"rg2 is %@", NSStringFromRange(rg2));//注意不能直接NSLog(@"rg2 is %@", rg2)，因为rg2不是对象（准确的说%@是指针）而是结构体
}
/*NSPoint表示一个点*/
void test2(){
    NSPoint p=NSMakePoint(10, 15);//NSPoint其实就是CGPoint
    //这种方式比较常见 NSPoint p2=CGPointMake(10, 15);
    NSLog(NSStringFromPoint(p2));
}
/*NSSize表示大小*/
void test3(){
    NSSize s=NSMakeSize(10, 15);//NSSize其实就是CGSize
    //这种方式比较常见 CGSize s2=CGSizeMake(10, 15);
    NSLog(NSStringFromSize(s2));
}
/*NSRect表示一个矩形*/
void test4(){
    NSRect r=NSMakeRect(10, 5, 100, 200);//NSRect其实就是CGRect
    //这种方式比较常见 NSRect r2=CGRectMake(10, 5, 100, 200);
    NSLog(NSStringFromRect(r2));
}


````

##  日期

````objc

    NSDate *date1=[NSDate date];//获得当前日期
    NSLog(@"%@",date1); //结果：2014-07-16 07:25:28 +0000
    
    NSDate *date2=[NSDate dateWithTimeIntervalSinceNow:100];//在当前日期的基础上加上100秒，注意在ObjC中多数时间单位都是秒
    NSLog(@"%@",date2); //结果：2014-07-16 07:27:08 +0000
    
    NSDate *date3=[NSDate distantFuture];//随机获取一个将来的日期
    NSLog(@"%@",date3); //结果：4001-01-01 00:00:00 +0000
    
    NSTimeInterval time=[date2 timeIntervalSinceDate:date1];//日期之差,返回单位为秒
    NSLog(@"%f",time); //结果：100.008833
    
    NSDate *date5=[date1 earlierDate:date3];//返回比较早的日期
    NSLog(@"%@",date5); //结果：2014-07-16 07:25:28 +0000
    
    //日期格式化
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    formater1.dateFormat=@"yy-MM-dd HH:mm:ss";
    NSString *datestr1=[formater1 stringFromDate:date1];
    NSLog(@"%@",datestr1); //结果：14-07-16 15:25:28
    //字符串转化为日期
    NSDate *date6=[formater1 dateFromString:@"14-02-14 11:07:16"];
    NSLog(@"%@",date6); //结果：2014-02-14 03:07:16 +0000


````objc


##  字符串

````objc

/**字符串操作*/
void test1(){
    char *str1="C string";//这是C语言创建的字符串
    NSString *str2=@"OC string";//ObjC字符串需要加@，并且这种方式创建的对象不需要自己释放内存

    //下面的创建方法都应该释放内存
    NSString *str3=[[NSString alloc] init];
    str3=@"OC string";
    NSString *str4=[[NSString alloc] initWithString:@"Objective-C string"];
    NSString *str5=[[NSString alloc] initWithFormat:@"age is %i,name is %.2f",19,1.72f];
    NSString *str6=[[NSString alloc] initWithUTF8String:"C string"];//C语言的字符串转换为ObjC字符串

    //以上方法都有对应静态方法（一般以string开头）,不需要管理内存（系统静态方法一般都是自动释放）
    NSString *str7=[NSString stringWithString:@"Objective-C string"];
}
void test2(){
    NSLog(@"\"Hello world!\" to upper is %@",[@"Hello world!" uppercaseString]);
    //结果："Hello world!" to upper is HELLO WORLD!
    NSLog(@"\"Hello world!\" to lowwer is %@",[@"Hello world!" lowercaseString]);
    //结果："Hello world!" to lowwer is hello world!
     
    //首字母大写，其他字母小写
    NSLog(@"\"Hello world!\" to capitalize is %@",[@"Hello world!" capitalizedString]);
    //结果："Hello world!" to capitalize is Hello World!
     
    BOOL result= [@"abc" isEqualToString:@"aBc"];
    NSLog(@"%i",result);
    //结果：0
    NSComparisonResult result2= [@"abc" compare:@"aBc"];//如果是[@"abc" caseInsensitiveCompare:@"aBc"]则忽略大小写比较
    if(result2==NSOrderedAscending){
        NSLog(@"left<right.");
    }else if(result2==NSOrderedDescending){
        NSLog(@"left>right.");
    }else if(result2==NSOrderedSame){
        NSLog(@"left=right.");
    }
    //结果：left>right.
}
void test3(){
    NSLog(@"has prefix ab? %i",[@"abcdef" hasPrefix:@"ab"]);
    //结果：has prefix ab? 1
    NSLog(@"has suffix ab? %i",[@"abcdef" hasSuffix:@"ef"]);
    //结果：has suffix ab? 1
    NSRange range=[@"abcdefabcdef" rangeOfString:@"cde"];//注意如果遇到cde则不再往后面搜索,如果从后面搜索或其他搜索方式可以设置第二个options参数
    if(range.location==NSNotFound){
        NSLog(@"not found.");
    }else{
        NSLog(@"range is %@",NSStringFromRange(range));
    }
    //结果：range is {2, 3}
}
//字符串分割
void test4(){
    NSLog(@"%@",[@"abcdef" substringFromIndex:3]);//从第三个索引开始（包括第三个索引对应的字符）截取到最后一位
    //结果：def
    NSLog(@"%@",[@"abcdef" substringToIndex:3]);////从0开始截取到第三个索引（不包括第三个索引对应的字符）
    //结果：abc
    NSLog(@"%@",[@"abcdef" substringWithRange:NSMakeRange(2, 3)]);
    //结果：cde
    NSString *str1=@"12.abcd.3a";
    NSArray *array1=[str1 componentsSeparatedByString:@"."];//字符串分割
    NSLog(@"%@",array1);
     /*结果：
      (
         12,
         abcd,
         3a
      )
      */
 
}
//其他操作
void test5(){
    NSLog(@"%i",[@"12" intValue]);//类型转换
    //结果：12
    NSLog(@"%zi",[@"hello world,世界你好！" length]);//字符串长度注意不是字节数
    //结果：17
    NSLog(@"%c",[@"abc" characterAtIndex:0]);//取出制定位置的字符
    //结果：a
    const char *s=[@"abc" UTF8String];//转换为C语言字符串
    NSLog(@"%s",s);
    //结果：abc
}

int main(int argc, const char * argv[]) {
    test1();
    test2();
    test3();
    test4();
    test5();
    return 0;
}
/*可变字符串，注意NSMutableString是NSString子类*/
    //注意虽然initWithCapacity分配字符串大小，但是不是绝对的不可以超过此范围，声明此变量对性能有好处
    NSMutableString *str1= [[NSMutableString alloc] initWithCapacity:10];
    [str1 setString:@"hello"];//设置字符串
    NSLog(@"%@",str1);
    //结果：hello

    [str1 appendString:@",world!"];//追加字符串
    NSLog(@"%@",str1);
    //结果：hello,world!

    [str1 appendFormat:@"我的年龄是%i。dear,I love you.",18];
    NSLog(@"%@",str1);
    //结果：hello,world!我的年龄是18。dear,I love you.
    
    //替换字符串
    NSRange range=[str1 rangeOfString:@"dear"];
    [str1 replaceCharactersInRange:range withString:@"Honey"];
    NSLog(@"%@",str1);
    //结果：hello,world!我的年龄是18。Honey,I love you.
    
    //插入字符串
    [str1 insertString:@"My name is Kenshin." atIndex:12];
    NSLog(@"%@",str1);
    //结果：hello,world!My name is Kenshin.我的年龄是18。Honey,I love you.
    
    //删除指定字符串
    [str1 deleteCharactersInRange:[str1 rangeOfString:@"My name is Kenshin."]];//删除指定范围的字符串
    NSLog(@"%@",str1);
    //结果：hello,world!我的年龄是18。Honey,I love you.
  

````  
    
## 数组

````objc

//NSArray长度不可变所以初始化的时候就赋值，并且最后以nil结尾
    //此外需要注意NSArray不能存放C语言的基础类型
    NSObject *obj=[[NSObject alloc]init];
    //NSArray *array1=[[NSArray alloc] initWithObjects:@"abc",obj,@"cde",@"opq", nil];
    NSArray *array1=[NSArray arrayWithObjects:@"abc",obj,@"cde",@"opq",@25, nil];
    NSLog(@"%zi",array1.count);//数组长度,结果：5
    NSLog(@"%i",[array1 containsObject:@"cde"]);//是否包含某个对象，结果：1
    NSLog(@"%@",[array1 lastObject]);//最后一个对象，结果：25
    NSLog(@"%zi",[array1 indexOfObject:@"abc"]);//对象所在的位置：0
    
    Person *person1=[Person personWithName:@"Kenshin"];
    Person *person2=[Person personWithName:@"Kaoru"];
    Person *person3=[Person personWithName:@"Rosa"];
    NSArray *array2=[[NSArray alloc]initWithObjects:person1,person2,person3, nil];
    [array2 makeObjectsPerformSelector:@selector(showMessage:) withObject:@"Hello,world!"];//执行所有元素的showMessage方法,后面的参数最多只能有一个
    /*结果：
     My name is Kenshin,the infomation is "Hello,world!".
     My name is Kaoru,the infomation is "Hello,world!".
     My name is Rosa,the infomation is "Hello,world!".
     */
}
//数组的遍历
void test2(){
    NSObject *obj=[[NSObject alloc]init];
    NSArray *array=[[NSArray alloc] initWithObjects:@"abc",obj,@"cde",@"opq",@25, nil];
    //方法1
    for(int i=0,len=array.count;i<len;++i){
        NSLog(@"method1:index %i is %@",i,[array objectAtIndex:i]);
    }
    /*结果：
     method1:index 0 is abc
     method1:index 1 is <NSObject: 0x100106de0>
     method1:index 2 is cde
     method1:index 3 is opq
     method1:index 4 is 25
     */
    
    
    //方法2
    for(id obj in array){
        NSLog(@"method2:index %zi is %@",[array indexOfObject:obj],obj);
    }
    /*结果：
     method2:index 0 is abc
     method2:index 1 is <NSObject: 0x100602f00>
     method2:index 2 is cde
     method2:index 3 is opq
     method2:index 4 is 25
     */
    
    
    //方法3,利用代码块方法
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"method3:index %zi is %@",idx,obj);
        if(idx==2){//当idx=2时设置*stop为YES停止遍历
            *stop=YES;
        }
    }];
    /*结果：
     method3:index 0 is abc
     method3:index 1 is <NSObject: 0x100106de0>
     method3:index 2 is cde
     */
    
    
    //方法4，利用迭代器
    //NSEnumerator *enumerator= [array objectEnumerator];//获得一个迭代器
    NSEnumerator *enumerator=[array reverseObjectEnumerator];//获取一个反向迭代器
    //NSLog(@"all:%@",[enumerator allObjects]);//获取所有迭代对象，注意调用完此方法迭代器就遍历完了，下面的nextObject就没有值了
    id obj2=nil;
    while (obj2=[enumerator nextObject]) {
        NSLog(@"method4:%@",obj2);
    }
    /*结果：
     method4:25
     method4:opq
     method4:cde
     method4:<NSObject: 0x100106de0>
     method4:abc
     */
}
//数组派生出新的数组
void test3(){
    NSArray *array=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    NSArray *array2=[array arrayByAddingObject:@"4"];//注意此时array并没有变
    NSLog(@"%@",array2);
    /*结果：
     (
         1,
         2,
         3,
         4
     )
     */
    
    
    NSLog(@"%@",[array2 arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"5",@"6", nil]]);//追加形成新的数组
    /*结果：
     (
         1,
         2,
         3,
         4,
         5,
         6
     )
     */
    
    
    NSLog(@"%@",[array2 subarrayWithRange:NSMakeRange(1, 3)]);//根据一定范围取得生成一个新的数组
    /*结果：
     (
         2,
         3,
         4
     )
     */
    
````

## 字典的使用

````objc

    void test1(){
    NSDictionary *dic1=[NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
    NSLog(@"%@",dic1);
    /*结果：
     {
        a = 1;
     }
     */
    
    //常用的方式
    NSDictionary *dic2=[NSDictionary dictionaryWithObjectsAndKeys:
                        @"1",@"a",
                        @"2",@"b",
                        @"3",@"c",
                        nil];
    NSLog(@"%@",dic2);
    /*结果：
     {
         a = 1;
         b = 2;
         c = 3;
     }
     */
    
    
    NSDictionary *dic3=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"2", nil] forKeys:[NSArray arrayWithObjects:@"a",@"b", nil]];
    NSLog(@"%@",dic3);
    /*结果：
     {
         a = 1;
         b = 2;
     }
     */
    
    
    //更简单的方式
    NSDictionary *dic4=@{@"1":@"a",@"2":@"b",@"3":@"c"};
    NSLog(@"%@",dic4);
    /*结果：
     {
         1 = a;
         2 = b;
         3 = c;
     }
     */
}
  //遍历1
    for (id key in dic1) {//注意对于字典for遍历循环的是key
        NSLog(@"%@=%@",key,[dic1 objectForKey:key]);
    }
    /*结果：
     d=2
     b=2
     c=3
     a=1
     */
    
    //遍历2
    NSEnumerator *enumerator=[dic1 keyEnumerator];//还有值的迭代器[dic1 objectEnumerator]
    id key=nil;
    while (key=[enumerator nextObject]) {
        NSLog(@"%@=%@",key,[dic1 objectForKey:key]);
        
    }
    /*结果：
     d=2
     b=2
     c=3
     a=1
     */
    
    //遍历3
    [dic1 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@=%@",key,obj);
    }];
    /*结果：
     d=2
     b=2
     c=3
     a=1
     */

````


##  装箱拆箱

### 基本类型

````objc
+(NSNumber *)numberWithChar:(char)value;

+(NSNumber *)numberWithInt:(int)value;

+(NSNumber *)numberWithFloat:(float)value;

+(NSNumber *)numberWithDouble:(double)value;

+(NSNumber *)numberWithBool:(BOOL)value;

+(NSNumber *)numberWithInteger:(NSInteger)value;

拆箱的过程就更加简单了，可以调用如下方法：

-(char)charValue;

-(int)intValue;

-(float)floatValue;

-(double)doubleValue;

-(BOOL)boolValue;

````


##  复杂类型

````objc

+(NSValue *)valueWithPoint:(NSPoint)point;

+(NSValue *)valueWithSize:(NSSize)size;

+(NSValue *)valueWithRect:(NSRect)rect;

对应的拆箱方法：

-(NSPoint)pointValue;

-(NSSize)sizeValue;

-(NSRect)rectValue;

````

##  结构体

````objc

+(NSValue *)valueWithBytes:(const void *)value objCType:(const char *)type;
示例
typedef struct {
    int year;
    int month;
    int day;
} Date;
##使用:

##  选项 NS_OPTIONS

````objc

//NS_OPTIONS，定义选项
typedef NS_OPTIONS(NSUInteger, MyOption) {
MyOptionNone = 0, //二进制0000,十进制0
MyOption1 = 1 << 0,//0001,1
MyOption2 = 1 << 1,//0010,2
MyOption3 = 1 << 2,//0100,4
MyOption4 = 1 << 3,//1000,8
};

//声明定义枚举变量
MyOption option = MyOption1 | MyOption2;//0001 | 0010 = 0011,3

//检查是否包含某选型
if ( option & MyOption3 ){ //0011 & 0100 = 0000
     //包含MyOption3
}else{
     //不包含MyOption3
}

````

//增加选项:
option = option | MyOption4;//0011 | 1000 = 1011, 11
//减少选项
option = option & (~MyOption4);//1011 & (~1000) = 1011 & 0111 = 0011, 3

//NSNumber是NSValue的子类，而NSValue可以包装任何类型，包括结构体
void test1(){
    //如果我们自己定义的结构体包装
    Date date={2014,2,28};
    char *type=@encode(Date);
    NSValue *value=[NSValue value:&date withObjCType:type];//第一参数传递结构体地址，第二个参数传递类型字符串
    NSArray *array=[NSArray arrayWithObject:value];
    NSLog(@"%@",array2);
    /*结果：
     (
        "<de070000 02000000 1c000000>"
     )
     */
    
    Date date2;
    [value getValue:&date];//取出对应的结构体，注意没有返回值
    //[value3 objCType]//取出包装内容的类型
    NSLog(@"%i,%i,%i",date2.year,date2.month,date2.day); //结果：2014,2,28
    
}

````


##  反射

````objc

###  基本方法

````objc

NSLog(@"%i",[person1 isKindOfClass:[NSObject class]]); //判断一个对象是否为某种类型（如果是父类也返回YES），结果：1
NSLog(@"%i",[person1 isMemberOfClass:[NSObject class]]); //判断一个对象是否是某个类的实例化对象，结果：0
NSLog(@"%i",[person1 isMemberOfClass:[Person class]]); //结果：1
NSLog(@"%i",[person1 conformsToProtocol:@protocol(NSCopying)]);//是否实现了某个协议，结果：0
NSLog(@"%i",[person1 respondsToSelector:@selector(showMessage:)]);//是否存在某个方法，结果：
//直接调用一个方法
person1 showMessage:@"Hello,world!"];
//动态调用一个方法，注意如果有参数那么参数类型只能为ObjC对象，并且最多只能有两个参数
[person1 performSelector:@selector(showMessage:) withObject:@"Hello,world!"];
  
###  动态生成一个类

````objc
Class myClass=NSClassFromString(@"Person");//根据类名生成类
````

##  文件操作

````objc

/*目录操作*/
void test1(){
    //文件管理器是专门用于文件管理的类
    NSFileManager *manager=[NSFileManager defaultManager];
    
    //获得当前程序所在目录(当然可以改变)
    NSString *currentPath=[manager currentDirectoryPath];
    NSLog(@"current path is :%@",currentPath);
    //结果：/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug
    
    //创建目录
    NSString *myPath=@"/Users/kenshincui/Desktop/myDocument";
    BOOL result= [manager createDirectoryAtPath:myPath withIntermediateDirectories:YES attributes:nil error:nil];
    if(result==NO){
        NSLog(@"Couldn't create directory!");
    }
    
    //目录重命名，如果需要删除目录只要调用removeItemAtPath:<#(NSString *)#> error:<#(NSError **)#>
    NSError *error;
    NSString *newPath=@"/Users/kenshincui/Desktop/myNewDocument";
    if([manager moveItemAtPath:myPath toPath:newPath error:&error]==NO){
        NSLog(@"Rename directory failed!Error infomation is:%@",error);
    }
    
    //改变当前目录
    if([manager changeCurrentDirectoryPath:newPath]==NO){
        NSLog(@"Change current directory failed!");
    }
    NSLog(@"current path is :%@",[manager currentDirectoryPath]);
    //结果：current path is :/Users/kenshincui/Desktop/myNewDocument
    
    //遍历整个目录
    NSString *path;
    NSDirectoryEnumerator *directoryEnumerator= [manager enumeratorAtPath:newPath];
    while (path=[directoryEnumerator nextObject]) {
        NSLog(@"%@",path);
    }
    /*结果：
     documents
     est.txt
    */
    
    //或者这样遍历
    NSArray *paths= [manager contentsOfDirectoryAtPath:newPath error:nil];
    NSObject *p;
    for (p in paths) {
        NSLog(@"%@",p);
    }
    /*结果：
     documents
     est.txt
     */
}

/*文件操作*/
void test2(){
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *filePath=@"/Users/kenshincui/Desktop/myNewDocument/test.txt";
    NSString *filePath2=@"/Users/kenshincui/Desktop/test.txt";
    NSString *newPath=@"/Users/kenshincui/Desktop/myNewDocument/test2.txt";
    
    //判断文件是否存在，这个方法也可以判断目录是否存在，这要后面的参数设置位YES
    if ([manager fileExistsAtPath:filePath isDirectory:NO]) {
        NSLog(@"File exists！");
    }
    
    //文件是否可读
    if([manager isReadableFileAtPath:filePath]){
        NSLog(@"File is readable!");
    }
    
    //判断两个文件内容是否相等
    if ([manager contentsEqualAtPath:filePath andPath:filePath2]) {
        NSLog(@"file1 equals file2");
    }
    
    //文件重命名，方法类似于目录重命名
    if (![manager moveItemAtPath:filePath toPath:newPath error:nil]) {
        NSLog(@"Rename file1 failed!");
    }
    
    //文件拷贝
    NSString *filePath3=@"/Users/kenshincui/Desktop/test3.txt";
    if(![manager copyItemAtPath:newPath toPath:filePath3 error:nil]){
        NSLog(@"Copy failed!");
    }
    
    //读取文件属性
    NSDictionary *attributes;
    if ((attributes=[manager attributesOfItemAtPath:newPath error:nil])==nil) {
        NSLog(@"Read attributes failed!");
    }
    for (NSObject *key in attributes) {
        NSLog(@"%@=%@",key,attributes[key]);
    }
    /*结果：
         NSFileOwnerAccountID=501
         NSFileHFSTypeCode=0
         NSFileSystemFileNumber=1781953
         NSFileExtensionHidden=0
         NSFileSystemNumber=16777218
         NSFileSize=27
         NSFileGroupOwnerAccountID=20
         NSFileOwnerAccountName=kenshincui
         NSFileCreationDate=2014-07-28 11:47:58 +0000
         NSFilePosixPermissions=420
         NSFileHFSCreatorCode=0
         NSFileType=NSFileTypeRegular
         NSFileExtendedAttributes={
         "com.apple.TextEncoding" = <7574662d 383b3133 34323137 393834>;
         }
         NSFileGroupOwnerAccountName=staff
         NSFileReferenceCount=1
         NSFileModificationDate=2014-07-28 11:47:58 +0000
     */
    
    //删除文件
    [manager removeItemAtPath:newPath error:nil];
    
}
//文件操作--文件内容操作（NSData，非结构化字节流对象，有缓冲区管理机制，可用于网络传输）
void test3(){
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *filePath=@"/Users/kenshincui/Desktop/myNewDocument/test2.txt";
    NSData *data=[manager contentsAtPath:filePath];
    NSLog(@"%@",data);//存储的是二进制字节流
    //结果:<68656c6c 6f20776f 726c642c e4b896e7 958ce4bd a0e5a5bd efbc81>
    
    //NSData转化成字符串
    NSString *str1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",str1);
    //结果：hello world,世界你好！
    
    //字符串转化成NSData
    NSString *str2=@"Kenshin";
    NSData *data2=[str2 dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",data2);
    
    //当然一般如果仅仅是简单读取文件内容，直接用户NSString方法即可
    NSString *content=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",content);
    //结果：hello world,世界你好！
    
}
//文件操作--细粒度控制文件,文件操作柄
void test4(){
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *filePath=@"/Users/kenshincui/Desktop/myNewDocument/test2.txt";
    
    //以只读方式打开文件
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForReadingAtPath:filePath];//注意这个方法返回类型为instancetype，也就是说对于上面的NSFileHandle它的返回类型也是NSFileHandle
    NSData *data= [fileHandle readDataToEndOfFile];//完整读取文件
    NSString *newPath=@"/Users/kenshincui/Desktop/test4.txt";
    [manager createFileAtPath:newPath contents:nil attributes:nil];
    NSFileHandle *fileHandle2=[NSFileHandle fileHandleForWritingAtPath:newPath];//以可写方式打开文件
    [fileHandle2 writeData:data];//写入文件内容
    
    [fileHandle2 closeFile];//关闭文件

    
    //定位到指定位置,默认在文件开头
    [fileHandle seekToFileOffset:12];
    NSData *data2= [fileHandle readDataToEndOfFile];
    NSLog(@"data2=%@",[[NSString alloc]initWithData:data2 encoding:NSUTF8StringEncoding]);
    //结果：data2=世界你好！
    
    [fileHandle seekToFileOffset:6];
    NSData *data3=[fileHandle readDataOfLength:5];
    NSLog(@"data3=%@",[[NSString alloc]initWithData:data3 encoding:NSUTF8StringEncoding]);
    //结果：data3=world
    
    [fileHandle closeFile];
    
}

//文件路径
void test5(){
    NSString *filePath=@"/Users/kenshincui/Desktop/myDocument";
    NSString *filePath2=@"/Users/kenshincui/Desktop/test.txt";

    //临时文件所在目录
    NSString *path=NSTemporaryDirectory();
    NSLog(@"temporary directory is :%@",path);
    //结果：/var/folders/h6/lss6gncs509c2pgzgty3wd_40000gn/T/

    NSString *lastComponent= [filePath lastPathComponent];
    NSLog(@"%@",lastComponent); //结果：myDocument
    
    NSLog(@"%@",[filePath stringByDeletingLastPathComponent]);
    //结果：/Users/kenshincui/Desktop
    NSLog(@"%@",[filePath stringByAppendingPathComponent:@"Pictrues"]);
    //结果：/Users/kenshincui/Desktop/myDocument/Pictrues
    NSLog(@"%@",[filePath2 pathExtension]);
    //结果：txt
    
    [[filePath pathComponents] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"%i=%@",idx,obj);
    }];
    /*结果：
     0=/
     1=Users
     2=kenshincui
     3=Desktop
     4=myDocument
     */
    
    
}

//文件操作--NSURL
void test6(){
    NSURL *url=[NSURL URLWithString:@"http://developer.apple.com"];
    NSString *str1=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str1);
}

//文件操作--NSBundle，程序包，一般用于获取Resource中的资源（当然由于当前并非IOS应用没有程序包，只是表示当前程序运行路径）
//在ios中经常用于读取应用程序中的资源文件，如图片、声音、视频等
void test7(){
    //在程序包所在目录创建一个文件
    NSFileManager *manager=[NSFileManager defaultManager];
    NSString *currentPath=[manager currentDirectoryPath];
    NSLog(@"current path is :%@",currentPath);
    //结果：current path is :/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug
    NSString *filePath=[currentPath stringByAppendingPathComponent:@"test.txt"];
    [manager createFileAtPath:filePath contents:[@"Hello,world!" dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    
    
    //利用NSBundle在程序包所在目录查找对应的文件
    NSBundle *bundle=[NSBundle mainBundle];//主要操作程序包所在目录
    //如果有test.txt则返回路径，否则返回nil
    NSString *path=[bundle pathForResource:@"test" ofType:@"txt"];//也可以写成：[bundle pathForResource:@"instructions.txt" ofType:nil];
    NSLog(@"%@",path);
    //结果：/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug/test.txt
    NSLog(@"%@",[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil]);
    //结果：Hello,world!
    
    //假设我们在程序运行创建一个Resources目录，并且其中新建pic.jpg，那么用下面的方法获得这个文件完整路径
    NSString *path1= [bundle pathForResource:@"pic" ofType:@"jpg" inDirectory:@"Resources"];
    NSLog(@"%@",path1);
    //结果：/Users/kenshincui/Library/Developer/Xcode/DerivedData/FoundationFramework-awxjohcpgsqcpsanqofqogwbqgbx/Build/Products/Debug/Resources/pic.jpg
}

int main(int argc,char *argv[]){

    test1();
    test2();
    test3();
    test4();
    test5();
    test6();
    test7();
    
    return 0;
}

````




##  归档

````objc

#import <Foundation/Foundation.h>

//xml属性
void test1(){
    //数组
    NSString *path=@"/Users/kenshincui/Desktop/arrayXml.plist";
    NSArray *array1=@[@"Kenshin",@"Kaoru",@"Rosa"];
    [array1 writeToFile:path atomically:YES];
    
    NSArray *array2=[NSArray arrayWithContentsOfFile:path];
    [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"array2[%lu]=%@",idx,obj);
    }];
    /*结果：
     array1[0]=Kenshin
     array1[1]=Kaoru
     array1[2]=Rosa
     */
    
    
    //字典
    NSString *path2=@"/Users/kenshincui/Desktop/dicXml.plist";
    NSDictionary *dic1=@{@"name":@"Kenshin",@"age":@28,@"height":@172.5};
    [dic1 writeToFile:path2 atomically:YES];
    
    NSDictionary *dic2=[NSDictionary dictionaryWithContentsOfFile:path2];
    [dic2 enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"dic2[%@]=%@",key,obj);
    }];
    /*结果：
     dic2[height]=172.5
     dic2[age]=28
     dic2[name]=Kenshin
     */
}

int main(int argc,char *argv[]){
    
    test1();
    
    return 0;
}

－－－－－－NSKeyedArchiver－－－－－－
//系统对象简单归档
void test1(){
    //NSString归档
    NSString *str1=@"Hello,world!";
    NSString *path1=@"/Users/kenshincui/Desktop/archiver1.arc";
    if(![NSArchiver archiveRootObject:str1 toFile:path1]){
        NSLog(@"archiver failed!");
    }
    //NSString解档
    NSString *str2= [NSUnarchiver unarchiveObjectWithFile:path1];
    NSLog(@"str2=%@",str2);//结果：str2=Hello,world!
    
    
    //NSArray归档
    NSString *path2=@"/Users/kenshincui/Desktop/archiver2.arc";
    NSArray *array1=@[@"Kenshin",@"Kaoru",@"Rosa"];
    if(![NSArchiver archiveRootObject:array1 toFile:path2]){
        NSLog(@"archiver failed!");
    }
    //NSArray解档
    NSArray *array2=[NSUnarchiver unarchiveObjectWithFile:path2];
    [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"array2[%lu]=%@",idx,obj);
    }];
    /*结果：
     array2[0]=Kenshin
     array2[1]=Kaoru
     array2[2]=Rosa
     */
}

//系统复杂对象归档（多对象归档）
void test2(){
    /*归档*/
    NSString *path1=@"/Users/kenshincui/Desktop/archiver3.arc";
    
    int int1=89;
    CGSize size1={12.5,16.8};
    NSNumber *number1=@60.5;
    NSString *str1=@"Hello,world!";
    NSArray *array1=@[@"Kenshin",@"Kaoru",@"Rosa"];
    NSDictionary *dic1=@{@"name":@"Kenshin",@"age":@28,@"height":@172.5};
    
    //同时对多个对象进行归档
    NSMutableData *data1=[[NSMutableData alloc]init];//定义一个NSMutableData用于临时存放数据
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data1];//定义归档对象
    [archiver encodeInt:int1 forKey:@"int"];//对int1归档并指定一个key以便以后读取
    [archiver encodeSize:size1 forKey:@"size"];
    [archiver encodeObject:number1 forKey:@"number"];
    [archiver encodeObject:str1 forKey:@"string"];
    [archiver encodeObject:array1 forKey:@"array"];
    [archiver encodeObject:dic1 forKey:@"dic"];

    [archiver finishEncoding];//结束归档
    
    [data1 writeToFile:path1 atomically:YES];//写入文件
    
    
    
    /*解档*/
    int int2;
    CGSize size2;
    NSNumber *number2;
    NSString *str2;
    NSArray *array2;
    NSDictionary *dic2;
    
    NSData *data2=[[NSData alloc]initWithContentsOfFile:path1];//读出数据到NSData
    NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data2];
    
    int2= [unarchiver decodeInt64ForKey:@"int"];
    size2=[unarchiver decodeSizeForKey:@"size"];
    number2=[unarchiver decodeObjectForKey:@"number"];
    str2=[unarchiver decodeObjectForKey:@"string"];
    array2=[unarchiver decodeObjectForKey:@"array"];
    dic2=[unarchiver decodeObjectForKey:@"dic"];
    
    [unarchiver finishDecoding];
    
    NSLog(@"int2=%i,size=%@,number2=%@,str2=%@,array2=%@,dic2=%@",int2,NSStringFromSize(size2),number2,str2,array2,dic2);
    /*结果：
     int2=89,
     size={12.5, 16.800000000000001},
     number2=60.5,
     str2=Hello,world!,
     array2=(
         Kenshin,
         Kaoru,
         Rosa
     ),
     dic2={
         age = 28;
         height = "172.5";
         name = Kenshin;
     }
     */
}
接下来看一下自定义的对象如何归档，上面说了如果要对自定义对象进行归档那么这个对象必须实现NSCoding协议，在这个协议中有两个方法都必须实现：

-(void)encodeWithCoder:(NSCoder *)aCoder;通过给定的Archiver对消息接收者进行编码；

-(id)initWithCoder:(NSCoder *)aDecoder;从一个给定的Unarchiver的数据返回一个初始化对象；

这两个方法分别在归档和解档时调用。下面通过一个例子进行演示（注意对于自定义类的多对象归档与系统类多对象归档完全一样，代码中不再演示）：

Person.h

//
//  Person.h
//  FoundationFramework
//
//  Created by Kenshin Cui on 14-2-16.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) float height;
@property (nonatomic,assign) NSDate *birthday;

@end
Person.m

//
//  Person.m
//  FoundationFramework
//
//  Created by Kenshin Cui on 14-2-16.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark 解码
-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"decode...");
    if (self=[super init]) {
        self.name=[aDecoder decodeObjectForKey:@"name"];
        self.age=[aDecoder decodeInt64ForKey:@"age"];
        self.height=[aDecoder decodeFloatForKey:@"heiht"];
        self.birthday=[aDecoder decodeObjectForKey:@"birthday"];
    }
    return self;
}

#pragma mark 编码
-(void)encodeWithCoder:(NSCoder *)aCoder{
    NSLog(@"encode...");
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt64:_age forKey:@"age" ];
    [aCoder encodeFloat:_height forKey:@"height"];
    [aCoder encodeObject:_birthday forKey:@"birthday"];

}

#pragma mark 重写描述
-(NSString *)description{
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    formater1.dateFormat=@"yyyy-MM-dd";
    return [NSString stringWithFormat:@"name=%@,age=%i,height=%.2f,birthday=%@",_name,_age,_height,[formater1 stringFromDate:_birthday]];
}

@end
main.m

//
//  main.m
//  FoundationFramework
//
//  Created by Kenshin Cui on 14-2-16.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc,char *argv[]){

    //归档
    Person *person1=[[Person alloc]init];
    person1.name=@"Kenshin";
    person1.age=28;
    person1.height=1.72;
    NSDateFormatter *formater1=[[NSDateFormatter alloc]init];
    formater1.dateFormat=@"yyyy-MM-dd";
    person1.birthday=[formater1 dateFromString:@"1986-08-08"];
    
    NSString *path1=@"/Users/kenshincui/Desktop/person1.arc";
    
    [NSKeyedArchiver archiveRootObject:person1 toFile:path1];

    //解档
    Person *person2= [NSKeyedUnarchiver unarchiveObjectWithFile:path1];
    NSLog(@"%@",person2);
    /*结果：
     name=Kenshin,age=28,height=0.00,birthday=1986-08-08
     */
    
    return 0;
}

````


##  结构

````objc
定义结构：
//方式1：
struct PathAndColor{
    CGColorRef color;
    CGMutablePathRef path;
};
typedef struct PathAndColor PathAndColor;

//方式2：
typedef struct PathAndColor{
    CGColorRef color;
    CGMutablePathRef path;
} PathAndColor;

初始化
//方式1：
  PathAndColor currPath = {currColor,path};
//方式2：
  PathAndColor currPath ;
  currPath.color = currColor;
  currPath.path = path;

// 存入集合
  [paths addObject:[NSValue valueWithBytes:&currPath objCType:@encode(PathAndColor)]];
// 取出

NSValue *value = paths[index];
[noteGroupValue getValue:&noteGroup];

````
