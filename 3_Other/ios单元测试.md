
## 测试方法


一个测试方法是以 test 开头的测试类的实例方法，没有参数，满足条件的方法会自动归入测试方法。

例如： 

````objc

- (void)testExample {
 
}
````

testCase方法

````objc
//方法在XCTestCase的测试方法调用之前调用，可以在测试之前创建在test case方法中需要用到的一些对象等
- (void)setUp ;
//当测试全部结束之后调用tearDown方法，法则在全部的test case执行结束之后清理测试现场，释放资源删除不用的对象等
- (void)tearDown ;
//测试代码执行性能
- (void)testPerformanceExample
````

##  断言

````objc

//通用断言
XCTAssert(expression, format...)
//常用断言：
XCTAssertTrue(expression, format...)
XCTAssertFalse(expression, format...)
XCTAssertEqual(expression1, expression2, format...)
XCTAssertNotEqual(expression1, expression2, format...)
XCTAssertEqualWithAccuracy(expression1, expression2, accuracy, format...)
XCTAssertNotEqualWithAccuracy(expression1, expression2, accuracy, format...)
XCTAssertNil(expression, format...)
XCTAssertNotNil(expression, format...)

XCTFail(format...) //直接Fail的断言
````

##  异步测试

新版的XCTest框架现在测试可以等待指定长度的时间，一直到某些条件符合的时候在开始测试。而不用再写很多的GCD代码控制。

举个例子，具体说明看注释。

````objc
    - (void)testAsynExample {
    XCTestExpectation *exp = [self expectationWithDescription:@"这里可以是操作出错的原因描述。。。"];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        //模拟这个异步操作需要2秒后才能获取结果，比如一个异步网络请求
        sleep(2);
        //模拟获取的异步操作后，获取结果，测试断言
        XCTAssertEqual(@"a", @"a");
        //如果断言没问题，就调用fulfill宣布测试满足
        [exp fulfill];
    }];
    
    //设置延迟多少秒后，如果没有满足测试条件就报错
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

````

这个测试肯定是通过的，因为设置延迟为3秒，而异步操作2秒就除了一个正确的结果，并宣布了条件满足````  [exp fulfill] ````，但是当我们把延迟改成1秒，这个测试用例就不会成功，错误原因是 ````expectationWithDescription:@"这里可以是操作出错的原因描述。。。````


##  注意点

-	使用pod的项目中，在XC测试框架中测试内容包括第三方包时，需要手动去设置Header Search Paths才能找到头文件 ，还需要设置test target的PODS_ROOT。







##  执行测试

-	cmd + 5 切换到测试选项卡，单独或整体测试
-	cmd + U  运行单元测试
 



##  参考阅读

-	[cocoachina测试专题](http://www.cocoachina.com/cms/tags.php?/Xcode%E6%B5%8B%E8%AF%95/)