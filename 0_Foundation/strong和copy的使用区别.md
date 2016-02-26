
## 用法总结

-	1:copy：一般来说，有对应Mutab版本的类型，在声明属性是，使用copy关键字作为声明,例如````等等经常使用copy关键字，是因为他们有对应的可变类型：NSMutableString、NSMutableArray、NSMutableDic```` ,此外block也用过使用copy

-	2:strong：出copy的绝大多数情况下使用strong关键字。

-	3:NSMutableString、NSMutableArray、NSMutableDic不能使用copy类型，否则调用mubtab版本的方法时直接会抛异常。

说到底，其实就是不同的修饰符，对应不同的setter方法，
1. strong对应的setter方法，是将_property先release（_property release），然后将参数retain（property retain），最后是_property = property。
2. copy对应的setter方法，是将_property先release（_property release），然后拷贝参数内容（property copy），创建一块新的内存地址，最后_property = property。

## 给NSArray使用错误关键词的反例(NSString错误同理)

LYWUser.h

````objc

@interface LYWUser : NSObject
@property (strong) NSArray *arry_strong;
@property (copy) NSArray *arry_copy;
...

@end

````

````objc

@interface Person : NSObject
@property (strong, nonatomic) NSArray *bookArray1;
@property (copy, nonatomic) NSArray *bookArray2;
@end

 


//NSArray 为什么使用copy而不用strong，因为有可能在无意识情况下修改数据
- (void)test2{
      LYWUser *user = [[LYWUser alloc]init];
      NSMutableArray *marry =  [NSMutableArray arrayWithObjects:@"a",@"b", nil];
      user.arry_strong = marry;
      user.arry_copy = marry;
      [marry addObject:@"c"];
      
      NSLog(@"arry_strong:%@ arry_copy:%@",user.arry_strong,user.arry_copy);
//    
//    2016-02-15 15:24:51.028 foo[4488:323714] arry_strong:(
//                                                           a,
//                                                           b,
//                                                           c
//                                                           )
//                                             arry_copy:(
//                                                           a,
//                                                           b
//                                                           )
//
//
}

````

可以看到，如果使用strong修饰，在修改marry数组的值后会使arry_strong的值也发生变化，这个往往并不是我们希望看到的。

同理，NSString使用strong也会有这样的问题

````objc
//NSString 为什么使用copy而不用strong，因为有可能在无意识情况下修改数据
- (void)test3{
    LYWUser *user = [LYWUser factoryA];
    NSMutableString *str = [NSMutableString stringWithString:@"a"];
    user.str_copy = str;
    user.str_strong = str;
    [str appendString:@"b"];
    NSLog(@"str_copy:%@ str_strong:%@",user.str_copy,user.str_strong);
    //    2016-02-15 15:56:55.297 foo[4858:343980] str_copy:a str_strong:ab

}
````




