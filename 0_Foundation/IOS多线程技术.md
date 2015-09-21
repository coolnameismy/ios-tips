

## 1:performSelector 多线程

````objc
/*
 *使用performSelector 的多线程
 *优点：简单
 *缺点：没有串行并线队列，不能实现高级线程调度
 */
 
-(void)performSelectorFunction{
    
    NSLog(@"performSelectorFunction start");

    //同步方式执行
    //[self performSelector:@selector(function1)];
    
    //延迟两秒执行,主线程阻塞
    //[self performSelector:@selector(function1) withObject:nil afterDelay:2];

    //主线程上执行，主线程阻塞，waitUntilDone:YES：等待执行完成顺序执行，waitUntilDone:NO 现执行后面语句
    //[self performSelectorOnMainThread:@selector(function1) withObject:nil waitUntilDone:NO];
    
    //子线程上执行
    [self performSelectorInBackground:@selector(function1) withObject:nil];
    
    NSLog(@"performSelectorFunction end");
    
}

````

## 2:NSThread

````objc
/*
 *使用NSThread 的多线程
 *优点：简单
 *缺点：没有串行并线队列，不能实现高级线程调度,和performSelector是一样的。
 */

-(void)NSThreadFunction{
    
    NSLog(@"NSThreadFunction start");
    
    //线程暂停 2秒
    //[NSThread sleepForTimeInterval:2];
    
    //显示创建的方式执行
    //NSThread *myThread = [[NSThread alloc]initWithTarget:self selector:@selector(function1) object:nil];
    //[myThread start];
    
    //静态方法执行线程
    //[NSThread detachNewThreadSelector:@selector(function1) toTarget:self withObject:nil];
    
    NSLog(@"NSThreadFunction end");
    
}

````


## 3:NSTimer(反面教材，他不是多线程，他只是定时执行任务)

````objc
/*
 *使反面教材，他不是多线程，他只是定时执行任务
 */

-(void)NSTimerFunction{
    
    NSLog(@"NSTimerFunction start");
    
    //定时执行任务，可以重复和不重复
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(function1) userInfo:nil repeats:NO];
    
    //暂时停止定时器
    //[timer setFireDate:[NSDate distantFuture]];
    //重新开启定时器
    //[timer setFireDate:[NSDate distantPast]];
    //永久通知定时器
    //[timer invalidate];
    //timer = nil;
    
    NSLog(@"NSTimerFunction end");
    
}

````

## 4:GCD最棒的多线程使用api
> GCD 中主要的对象：

- dispatch_sync
- dispatch_async
- dispatch_once_t
- dispatch_after
- dispatch_queue_t
- dispatch_group_async
- dispatch_barrier_async
- dispatch_apply
- dispatch_suspend，dispatch_resume
- dispatch_sync
- dispatch_sync
- dispatch_sync


````objc

// dispatch_sync 同步方式执行：
 dispatch_sync(dispatch_get_global_queue(0, 0), ^{
      // something
 });


// dispatch_async 异步执行：
 dispatch_async(dispatch_get_global_queue(0, 0), ^{
      // something
 });

 // dispatch_async：主线程执行：
 dispatch_async(dispatch_get_main_queue(), ^{
      // something
 });

 // dispatch_once：一次性执行：
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
     // code to be executed once
 });

 //dispatch_time_t ：延迟2秒执行：
 double delayInSeconds = 2.0;
 dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
 dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
     // code to be executed on the main queue after delay
 });

 //dispatch_group_t： 合并汇总结果
 dispatch_group_t group = dispatch_group_create();
 dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
      // 并行执行的线程一
 });
 dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
      // 并行执行的线程二
 });
 dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
      // 汇总结果
 });


 //dispatch_barrier_async :作用是在并行队列中，等待前面的队列执行完成后在继续往下执行
dispatch_queue_t concurrentQueue = dispatch_queue_create("my.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
dispatch_async(concurrentQueue, ^(){
    NSLog(@"dispatch-1");
});
dispatch_async(concurrentQueue, ^(){
    NSLog(@"dispatch-2");
});
dispatch_barrier_async(concurrentQueue, ^(){
    NSLog(@"dispatch-barrier"); 
});
dispatch_async(concurrentQueue, ^(){
    NSLog(@"dispatch-3");
});
dispatch_async(concurrentQueue, ^(){
    NSLog(@"dispatch-4");
});

//dispatch_apply：将一个指定的block执行指定的次数，常用语block数组。在一般方法中虽然block中的方法并不是顺序执行，但是由于apply是线程同步的，
//所以print(dispatch_apply done);一定最后执行。常常可以这样用：
let globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
dispatch_async(globalQueue, { () -> Void in
    dispatch_apply(10, globalQueue) { (index) -> Void in
        print(index)
    }
    print("completed")
})
print("在dispatch_apply之前") 


//dispatch_suspend / dispatch_resume
//暂停
dispatch_suspend(globalQueue)
//恢复
dispatch_resume(globalQueue)

//Dispatch Semaphore 这个是线程的信号量，比较复杂

````

## 参考
http://liuyanwei.jumppo.com/2015/08/19/ios-ThreadAndAsynchronization.html
http://blog.csdn.net/zhangao0086/article/details/38904923
