
##  1:native调用js的时间间隔

实验一：测试native每10ms调用一次js，查看js是否能不掉包，每次都被调用

关键代码：

````objc

@property(nonatomic ,assign) NSInteger testNum;

#warning 测试10ms一次调用js，是否会出现性能问题
- (void)testCallJS {
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(test10msCallJS) userInfo:nil repeats:YES];
}


- (void)test10msCallJS {
    self.testNum++;
    if (self.testNum > 100) {
        return;
    }
    NSLog(@"native:%ld",(long)self.testNum);
    [_context evaluateScript:@"test10msCallJS()"];
}

````

````js
<script type="text/javascript">
	var i = 0;
	function test10msCallJS() {
		i++;
		var date = new Date();
		console.log("time:" + date.getSeconds() + "s/"+ date.getMilliseconds() + "ms || "+ "js:"+i);
	}
</script>
````

结论：没丢包，每次都可以正确调用,时间间隔1ms不差

日志：

````
2016-05-09 11:26:13.698 AlinkBLEProject[26442:2052569] native:1
2016-05-09 11:26:13.701 AlinkBLEProject[26442:2052569] native:2
2016-05-09 11:26:13.703 AlinkBLEProject[26442:2052569] native:3
2016-05-09 11:26:13.704 AlinkBLEProject[26442:2052569] native:4
2016-05-09 11:26:13.704 AlinkBLEProject[26442:2052569] native:5
2016-05-09 11:26:13.706 AlinkBLEProject[26442:2052569] native:6
2016-05-09 11:26:13.706 AlinkBLEProject[26442:2052569] native:7
2016-05-09 11:26:13.708 AlinkBLEProject[26442:2052569] native:8
2016-05-09 11:26:13.709 AlinkBLEProject[26442:2052569] native:9
2016-05-09 11:26:13.710 AlinkBLEProject[26442:2052569] native:10
2016-05-09 11:26:13.711 AlinkBLEProject[26442:2052569] native:11
2016-05-09 11:26:13.712 AlinkBLEProject[26442:2052569] native:12
2016-05-09 11:26:13.713 AlinkBLEProject[26442:2052569] native:13
2016-05-09 11:26:13.714 AlinkBLEProject[26442:2052569] native:14
2016-05-09 11:26:13.715 AlinkBLEProject[26442:2052569] native:15
2016-05-09 11:26:13.716 AlinkBLEProject[26442:2052569] native:16
2016-05-09 11:26:13.717 AlinkBLEProject[26442:2052569] native:17
2016-05-09 11:26:13.718 AlinkBLEProject[26442:2052569] native:18
2016-05-09 11:26:13.719 AlinkBLEProject[26442:2052569] native:19
2016-05-09 11:26:13.720 AlinkBLEProject[26442:2052569] native:20
2016-05-09 11:26:13.721 AlinkBLEProject[26442:2052569] native:21
2016-05-09 11:26:13.722 AlinkBLEProject[26442:2052569] native:22
2016-05-09 11:26:13.723 AlinkBLEProject[26442:2052569] native:23
2016-05-09 11:26:13.724 AlinkBLEProject[26442:2052569] native:24
2016-05-09 11:26:13.725 AlinkBLEProject[26442:2052569] native:25
2016-05-09 11:26:13.726 AlinkBLEProject[26442:2052569] native:26
2016-05-09 11:26:13.727 AlinkBLEProject[26442:2052569] native:27
2016-05-09 11:26:13.728 AlinkBLEProject[26442:2052569] native:28
2016-05-09 11:26:13.729 AlinkBLEProject[26442:2052569] native:29
2016-05-09 11:26:13.730 AlinkBLEProject[26442:2052569] native:30
2016-05-09 11:26:13.731 AlinkBLEProject[26442:2052569] native:31
2016-05-09 11:26:13.732 AlinkBLEProject[26442:2052569] native:32
2016-05-09 11:26:13.733 AlinkBLEProject[26442:2052569] native:33
2016-05-09 11:26:13.734 AlinkBLEProject[26442:2052569] native:34
2016-05-09 11:26:13.736 AlinkBLEProject[26442:2052569] native:35
2016-05-09 11:26:13.736 AlinkBLEProject[26442:2052569] native:36
2016-05-09 11:26:13.738 AlinkBLEProject[26442:2052569] native:37
2016-05-09 11:26:13.739 AlinkBLEProject[26442:2052569] native:38
2016-05-09 11:26:13.740 AlinkBLEProject[26442:2052569] native:39
2016-05-09 11:26:13.741 AlinkBLEProject[26442:2052569] native:40
2016-05-09 11:26:13.742 AlinkBLEProject[26442:2052569] native:41
2016-05-09 11:26:13.743 AlinkBLEProject[26442:2052569] native:42
2016-05-09 11:26:13.744 AlinkBLEProject[26442:2052569] native:43
2016-05-09 11:26:13.745 AlinkBLEProject[26442:2052569] native:44
2016-05-09 11:26:13.745 AlinkBLEProject[26442:2052569] native:45
2016-05-09 11:26:13.747 AlinkBLEProject[26442:2052569] native:46
2016-05-09 11:26:13.748 AlinkBLEProject[26442:2052569] native:47
2016-05-09 11:26:13.749 AlinkBLEProject[26442:2052569] native:48
2016-05-09 11:26:13.750 AlinkBLEProject[26442:2052569] native:49
2016-05-09 11:26:13.751 AlinkBLEProject[26442:2052569] native:50
2016-05-09 11:26:13.752 AlinkBLEProject[26442:2052569] native:51
2016-05-09 11:26:13.753 AlinkBLEProject[26442:2052569] native:52
2016-05-09 11:26:13.754 AlinkBLEProject[26442:2052569] native:53
2016-05-09 11:26:13.755 AlinkBLEProject[26442:2052569] native:54
2016-05-09 11:26:13.756 AlinkBLEProject[26442:2052569] native:55
2016-05-09 11:26:13.757 AlinkBLEProject[26442:2052569] native:56
2016-05-09 11:26:13.758 AlinkBLEProject[26442:2052569] native:57
2016-05-09 11:26:13.759 AlinkBLEProject[26442:2052569] native:58
2016-05-09 11:26:13.760 AlinkBLEProject[26442:2052569] native:59
2016-05-09 11:26:13.761 AlinkBLEProject[26442:2052569] native:60
2016-05-09 11:26:13.761 AlinkBLEProject[26442:2052569] native:61
2016-05-09 11:26:13.763 AlinkBLEProject[26442:2052569] native:62
2016-05-09 11:26:13.764 AlinkBLEProject[26442:2052569] native:63
2016-05-09 11:26:13.765 AlinkBLEProject[26442:2052569] native:64
2016-05-09 11:26:13.766 AlinkBLEProject[26442:2052569] native:65
2016-05-09 11:26:13.767 AlinkBLEProject[26442:2052569] native:66
2016-05-09 11:26:13.768 AlinkBLEProject[26442:2052569] native:67
2016-05-09 11:26:13.768 AlinkBLEProject[26442:2052569] native:68
2016-05-09 11:26:13.770 AlinkBLEProject[26442:2052569] native:69
2016-05-09 11:26:13.771 AlinkBLEProject[26442:2052569] native:70
2016-05-09 11:26:13.772 AlinkBLEProject[26442:2052569] native:71
2016-05-09 11:26:13.773 AlinkBLEProject[26442:2052569] native:72
2016-05-09 11:26:13.774 AlinkBLEProject[26442:2052569] native:73
2016-05-09 11:26:13.775 AlinkBLEProject[26442:2052569] native:74
2016-05-09 11:26:13.776 AlinkBLEProject[26442:2052569] native:75
2016-05-09 11:26:13.777 AlinkBLEProject[26442:2052569] native:76
2016-05-09 11:26:13.778 AlinkBLEProject[26442:2052569] native:77
2016-05-09 11:26:13.779 AlinkBLEProject[26442:2052569] native:78
2016-05-09 11:26:13.780 AlinkBLEProject[26442:2052569] native:79
2016-05-09 11:26:13.781 AlinkBLEProject[26442:2052569] native:80
2016-05-09 11:26:13.782 AlinkBLEProject[26442:2052569] native:81
2016-05-09 11:26:13.783 AlinkBLEProject[26442:2052569] native:82
2016-05-09 11:26:13.784 AlinkBLEProject[26442:2052569] native:83
2016-05-09 11:26:13.785 AlinkBLEProject[26442:2052569] native:84
2016-05-09 11:26:13.786 AlinkBLEProject[26442:2052569] native:85
2016-05-09 11:26:13.787 AlinkBLEProject[26442:2052569] native:86
2016-05-09 11:26:13.788 AlinkBLEProject[26442:2052569] native:87
2016-05-09 11:26:13.789 AlinkBLEProject[26442:2052569] native:88
2016-05-09 11:26:13.790 AlinkBLEProject[26442:2052569] native:89
2016-05-09 11:26:13.791 AlinkBLEProject[26442:2052569] native:90
2016-05-09 11:26:13.792 AlinkBLEProject[26442:2052569] native:91
2016-05-09 11:26:13.793 AlinkBLEProject[26442:2052569] native:92
2016-05-09 11:26:13.794 AlinkBLEProject[26442:2052569] native:93
2016-05-09 11:26:13.795 AlinkBLEProject[26442:2052569] native:94
2016-05-09 11:26:13.796 AlinkBLEProject[26442:2052569] native:95
2016-05-09 11:26:13.797 AlinkBLEProject[26442:2052569] native:96
2016-05-09 11:26:13.798 AlinkBLEProject[26442:2052569] native:97
2016-05-09 11:26:13.799 AlinkBLEProject[26442:2052569] native:98
2016-05-09 11:26:13.800 AlinkBLEProject[26442:2052569] native:99
2016-05-09 11:26:13.801 AlinkBLEProject[26442:2052569] native:100
````

````
[Log] time:13s/699ms || js:1 (app.html, line 25)
[Log] time:13s/701ms || js:2 (app.html, line 25)
[Log] time:13s/703ms || js:3 (app.html, line 25)
[Log] time:13s/704ms || js:4 (app.html, line 25)
[Log] time:13s/705ms || js:5 (app.html, line 25)
[Log] time:13s/706ms || js:6 (app.html, line 25)
[Log] time:13s/707ms || js:7 (app.html, line 25)
[Log] time:13s/708ms || js:8 (app.html, line 25)
[Log] time:13s/709ms || js:9 (app.html, line 25)
[Log] time:13s/710ms || js:10 (app.html, line 25)
[Log] time:13s/711ms || js:11 (app.html, line 25)
[Log] time:13s/712ms || js:12 (app.html, line 25)
[Log] time:13s/713ms || js:13 (app.html, line 25)
[Log] time:13s/714ms || js:14 (app.html, line 25)
[Log] time:13s/715ms || js:15 (app.html, line 25)
[Log] time:13s/716ms || js:16 (app.html, line 25)
[Log] time:13s/717ms || js:17 (app.html, line 25)
[Log] time:13s/718ms || js:18 (app.html, line 25)
[Log] time:13s/719ms || js:19 (app.html, line 25)
[Log] time:13s/720ms || js:20 (app.html, line 25)
[Log] time:13s/721ms || js:21 (app.html, line 25)
[Log] time:13s/722ms || js:22 (app.html, line 25)
[Log] time:13s/723ms || js:23 (app.html, line 25)
[Log] time:13s/724ms || js:24 (app.html, line 25)
[Log] time:13s/725ms || js:25 (app.html, line 25)
[Log] time:13s/726ms || js:26 (app.html, line 25)
[Log] time:13s/727ms || js:27 (app.html, line 25)
[Log] time:13s/728ms || js:28 (app.html, line 25)
[Log] time:13s/729ms || js:29 (app.html, line 25)
[Log] time:13s/730ms || js:30 (app.html, line 25)
[Log] time:13s/731ms || js:31 (app.html, line 25)
[Log] time:13s/732ms || js:32 (app.html, line 25)
[Log] time:13s/733ms || js:33 (app.html, line 25)
[Log] time:13s/734ms || js:34 (app.html, line 25)
[Log] time:13s/736ms || js:35 (app.html, line 25)
[Log] time:13s/737ms || js:36 (app.html, line 25)
[Log] time:13s/738ms || js:37 (app.html, line 25)
[Log] time:13s/739ms || js:38 (app.html, line 25)
[Log] time:13s/740ms || js:39 (app.html, line 25)
[Log] time:13s/741ms || js:40 (app.html, line 25)
[Log] time:13s/742ms || js:41 (app.html, line 25)
[Log] time:13s/743ms || js:42 (app.html, line 25)
[Log] time:13s/744ms || js:43 (app.html, line 25)
[Log] time:13s/745ms || js:44 (app.html, line 25)
[Log] time:13s/746ms || js:45 (app.html, line 25)
[Log] time:13s/747ms || js:46 (app.html, line 25)
[Log] time:13s/748ms || js:47 (app.html, line 25)
[Log] time:13s/749ms || js:48 (app.html, line 25)
[Log] time:13s/750ms || js:49 (app.html, line 25)
[Log] time:13s/751ms || js:50 (app.html, line 25)
[Log] time:13s/752ms || js:51 (app.html, line 25)
[Log] time:13s/753ms || js:52 (app.html, line 25)
[Log] time:13s/754ms || js:53 (app.html, line 25)
[Log] time:13s/755ms || js:54 (app.html, line 25)
[Log] time:13s/756ms || js:55 (app.html, line 25)
[Log] time:13s/757ms || js:56 (app.html, line 25)
[Log] time:13s/758ms || js:57 (app.html, line 25)
[Log] time:13s/759ms || js:58 (app.html, line 25)
[Log] time:13s/760ms || js:59 (app.html, line 25)
[Log] time:13s/761ms || js:60 (app.html, line 25)
[Log] time:13s/762ms || js:61 (app.html, line 25)
[Log] time:13s/763ms || js:62 (app.html, line 25)
[Log] time:13s/764ms || js:63 (app.html, line 25)
[Log] time:13s/765ms || js:64 (app.html, line 25)
[Log] time:13s/766ms || js:65 (app.html, line 25)
[Log] time:13s/767ms || js:66 (app.html, line 25)
[Log] time:13s/768ms || js:67 (app.html, line 25)
[Log] time:13s/769ms || js:68 (app.html, line 25)
[Log] time:13s/770ms || js:69 (app.html, line 25)
[Log] time:13s/771ms || js:70 (app.html, line 25)
[Log] time:13s/772ms || js:71 (app.html, line 25)
[Log] time:13s/773ms || js:72 (app.html, line 25)
[Log] time:13s/774ms || js:73 (app.html, line 25)
[Log] time:13s/775ms || js:74 (app.html, line 25)
[Log] time:13s/776ms || js:75 (app.html, line 25)
[Log] time:13s/777ms || js:76 (app.html, line 25)
[Log] time:13s/778ms || js:77 (app.html, line 25)
[Log] time:13s/779ms || js:78 (app.html, line 25)
[Log] time:13s/780ms || js:79 (app.html, line 25)
[Log] time:13s/781ms || js:80 (app.html, line 25)
[Log] time:13s/782ms || js:81 (app.html, line 25)
[Log] time:13s/783ms || js:82 (app.html, line 25)
[Log] time:13s/784ms || js:83 (app.html, line 25)
[Log] time:13s/785ms || js:84 (app.html, line 25)
[Log] time:13s/786ms || js:85 (app.html, line 25)
[Log] time:13s/787ms || js:86 (app.html, line 25)
[Log] time:13s/788ms || js:87 (app.html, line 25)
[Log] time:13s/789ms || js:88 (app.html, line 25)
[Log] time:13s/790ms || js:89 (app.html, line 25)
[Log] time:13s/791ms || js:90 (app.html, line 25)
[Log] time:13s/792ms || js:91 (app.html, line 25)
[Log] time:13s/793ms || js:92 (app.html, line 25)
[Log] time:13s/794ms || js:93 (app.html, line 25)
[Log] time:13s/795ms || js:94 (app.html, line 25)
[Log] time:13s/796ms || js:95 (app.html, line 25)
[Log] time:13s/797ms || js:96 (app.html, line 25)
[Log] time:13s/798ms || js:97 (app.html, line 25)
[Log] time:13s/799ms || js:98 (app.html, line 25)
[Log] time:13s/800ms || js:99 (app.html, line 25)
[Log] time:13s/801ms || js:100 (app.html, line 25)
````

实验二：测试native每1ms调用一次js，查看js是否能不掉包，每次都被调用

方法同上，改一下native的调用时间间隔。

结论：没丢包，每次都可以正确调用,时间间隔1ms不差

实验三：增加js代码中的逻辑处理，观察每次js调用的延迟

结论：js中的对应方法如果处理非常复杂，会占用js调用的通道，导致js调用出现延迟


##  2:测试高频调用notifycation通道阻塞

实验代码：

````objc
#warning 测试高频调用notify，是否会出现性能问题
- (void)test {
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(testNotify) userInfo:nil repeats:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eveluate) name:@"testnotificatef" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(normal) name:@"normal" object:nil];
}

- (void)test10msCallJS {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"testnotificatef" object:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"normal" object:nil];
}

- (void)normal {
    if (self.testNum > 100) {
        return;
    }
    NSLog(@"native-normal:%ld",(long)self.testNum);
}
- (void)eveluate {
    self.testNum++;
    if (self.testNum > 100) {
        return;
    }

    //使用线程做，减少延迟,不会把通知通道堵塞
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //做一些事情，增加延时
        for (int i =0; i< 100000; i++) {
            NSString *a = [NSString stringWithFormat:@"asddasd"];
            [a stringByAppendingString:@"a"];
            [a stringByAppendingString:@"a"];
            [a stringByAppendingString:@"a"];
            [a stringByAppendingString:@"a"];
        }
        NSLog(@"dispatch_async:%ld",(long)self.testNum);
    });   
}

````


结论： 推荐在notiy的接受事件中，如果调用特别频繁，需要使用多线程处理，不要在主通道方法中处理大量业务代码。
-  使用异步线程不会造成notiy通道阻塞，而去掉dispatch_async，会导致normal和eveluate同事进行，1秒钟的事件会在10秒执行完成。
-  频率高也会造成普通通道的少了延迟 （1ms一次调用，1000次会延迟0.129秒，10ms一次调用，100次会延迟0.01秒，测试环境为mac pro ,i7,16G）

