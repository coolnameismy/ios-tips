
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


objc

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

swift 

````swift

//监听是否可以前进后退，修改btn.enable属性
webView.addObserver(self, forKeyPath: "loading", options: .New, context: nil)
//监听加载进度
webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)

//重写self的kvo方法
override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
    if (keyPath == "loading") {
        gobackBtn.enabled = webView.canGoBack
        forwardBtn.enabled = webView.canGoForward
    }
    if (keyPath == "estimatedProgress") {
        //progress是UIProgressView
        progress.hidden = webView.estimatedProgress==1
        progress.setProgress(Float(webView.estimatedProgress), animated: true)
    }
}

````
