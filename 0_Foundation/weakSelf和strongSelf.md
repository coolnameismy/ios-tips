>	在block中常常会用到weakSelf和strong来处理block的产生循环引用的问题。

## 使用情况

-	直接在 block 里面使用关键词 self
-	在 block 外定义一个 __weak 的 引用到 self，并且在 block 里面使用这个弱引用
-	在 block 外定义一个 __weak 的 引用到 self，并在在 block 内部通过这个弱引用定义一个 __strong 的引用。

### 直接在 block 里面使用关键词 self

当block并没有被self对象所引用时，一般可以直接使用self，例如：

````objc
    dispatch_block_t completionBlock2 = ^(){
        NSLog(@"complete");NSLog(@"%@", self);
    };

	[self presentViewController:myController
	           animated:YES
	         completion:completionBlock2];

````

### 使用weakself

当block对象被self持有时，一定要使用weakself避免循环引用。

````
__weak typeof(self) weakSelf = self;
self.completionHandler = ^{
    NSLog(@"%@", weakSelf);
};

MyViewController *myController = [[MyViewController alloc] init...];
[self presentViewController:myController
                   animated:YES
                 completion:self.completionHandler];
````

### 使用__strong

当block中执行多个self的方法时，推荐在block中使用strongSelf，这样更严谨和安全，因为如果weakSelf有可能在一些方法中被释放导致后续方法无法执行。

````
__weak typeof(self) weakSelf = self;
myObj.myBlock =  ^{
    __strong typeof(self) strongSelf = weakSelf;
    if (strongSelf) {
      [strongSelf doSomething]; // strongSelf != nil
      // preemption, strongSelf still not nil（抢占的时候，strongSelf 还是非 nil 的)
      [strongSelf doSomethingElse]; // strongSelf != nil
    }
    else {
        // Probably nothing...
        return;
    }
};
````

### 总结

一般来说：如果block不是属性则使用self，是属性但block中调用单个self的方法时用weakSelf，多个方法用strongSelf


##	简单处理weakself和strongSelf

````objc
__weak __typeof(self) weakSelf = self;
__strong __typeof(weakSelf) strongSelf = weakSelf;

````

建议把这两段代码添加到xcode snippet library中。

添加方式：直接把代码行分别拖入，重新命名snippet，设置title和complete shortcut（快捷键），类型选择code expresssion。建议title和shortcut都使用weakify和strongify

## 例子

````objc
__weak __typeof(self) weakSelf = self;
[self executeBlock:^(NSData *data, NSError *error) {
    [weakSelf doSomethingWithData:data];
}];

//不要这样

[self executeBlock:^(NSData *data, NSError *error) {
    [self doSomethingWithData:data];
}];
````

多个语句的例子:

````objc
__weak __typeof(self)weakSelf = self;
[self executeBlock:^(NSData *data, NSError *error) {
    __strong __typeof(weakSelf) strongSelf = weakSelf;
    if (strongSelf) {
        [strongSelf doSomethingWithData:data];
        [strongSelf doSomethingWithData:data];
    }
}];

//不要这样:

__weak __typeof(self)weakSelf = self;
[self executeBlock:^(NSData *data, NSError *error) {
    [weakSelf doSomethingWithData:data];
    [weakSelf doSomethingWithData:data];
}];
````

##  定义宏@weakify和@strongify处理

待更新，还没研究清楚实现方式.

