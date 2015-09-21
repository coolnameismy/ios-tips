
## Notification

````objc
//1:注册监听
//订阅NSNotificationCenter
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"test" object:nil];

//2:监听事件
- (void)receiveNotification:(id)sender {
    NSLog(@"receive msg is:%@",sender);
}

//3:发送notification
[[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:self.testString];

````

## KVO

````objc

//1:设置监听对象
//@property(nonatomic,strong) NSString *testString;
[self addObserver:self forKeyPath:@"testString" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"testString has changed"];

//2:注册监听
//当发起监听的对象的对应keypath改变时，即引起事件 ！！！！！注意：使用_testString的方法不起作用！！！！！！！
self.testString = @"hello observe !!!";

//3:注册监听委托方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%@",context);
}

````
