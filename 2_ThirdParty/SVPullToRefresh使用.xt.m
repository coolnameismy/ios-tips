SVPullToRefr


  //注册下拉刷新功能
    __weak BaseTableViewController *weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weakSelf insertRowAtTop];
    }];
    //注册上拉刷新功能
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weakSelf insertRowAtBottom];
    }];

//业务步骤
    //开始更新
    [self.tableView beginUpdates];
    
    [NSThread sleepForTimeInterval:1];
    
    //结束更新
    [self.tableView endUpdates];
    
    //停止菊花
    [self.tableView.pullToRefreshView stopAnimating];



3、程序自动调用下拉刷新

[csharp] view plaincopy
[tableView triggerPullToRefresh];  

4、临时性禁用下拉刷新
[csharp] view plaincopy
tableView.showsPullToRefresh = NO;  
SVPullToRefresh的UI支持自定义
下拉刷新对应的view名叫pullToRefreshView，有如下属性和方法修改它的显示。

[csharp] view plaincopy
@property (nonatomic, strong) UIColor *arrowColor;  
@property (nonatomic, strong) UIColor *textColor;  
@property (nonatomic, readwrite) UIActivityIndicatorViewStyle activityIndicatorViewStyle;  
  
- (void)setTitle:(NSString *)title forState:(SVPullToRefreshState)state;  
- (void)setSubtitle:(NSString *)subtitle forState:(SVPullToRefreshState)state;  
- (void)setCustomView:(UIView *)view forState:(SVPullToRefreshState)state;  
简单用法，比如下面一行代码就修改了下拉箭头的颜色。
[csharp] view plaincopy
tableView.pullToRefreshView.arrowColor = [UIColor whiteColor];  


＝＝＝＝＝＝＝引用＝＝＝＝＝＝＝＝＝＝＝＝
http://blog.csdn.net/itenric/article/details/12391185
http://www.jianshu.com/p/783ac913120d