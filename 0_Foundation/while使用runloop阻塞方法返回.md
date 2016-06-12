while使用runloop阻塞方法返回

示例如下

````objc
//异步的同步方法
- (void)foo {
    __block  BOOL isStop = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        isStop = NO;
    });

    while (isStop) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
}
````

如果没有 ` [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]; ` 这句话，那么cpu会高到100%，但是加了后，cpu就为0，且可以阻塞方法执行。

例如：

````objc
//用法
NSLog(@"start foo");
[self foo];
//方法会在5秒后继续往下执行
NSLog(@"done foo");
````