
## iOS9修改状态栏字体颜色

第一步：在info.plist中添加一个字段：UIViewControllerBasedStatusBarAppearance 设置值为 NO

第二步，设置状态栏颜色:
UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent


##	注意点

1:ios 9 以下操作方式和上面的不同

-	第一步的key为：view controller -base status bar 
-	第二步的方法为：[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];

2：ios 9 修改状态栏会产生一个警告，这个是xcode的bug，可以忽略 [参考地址](https://forums.developer.apple.com/thread/13683)

//iOS 9 推荐使用 UIViewController preferredStatusBarStyle方法
@available(iOS, introduced=2.0, deprecated=9.0, message="Use -[UIViewController preferredStatusBarStyle]")

这里需要重写preferredStatusBarStyle方法，示例：

````swift

var _statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.Default
var statusBarStyle:UIStatusBarStyle {
    set{
        self._statusBarStyle = newValue
        self.setNeedsStatusBarAppearanceUpdate()
    }
    get{
        return self._statusBarStyle
    }
}
override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return self._statusBarStyle
}


var _statusBarHidden:Bool = false;
var statusBarHidden:Bool{
    set{
        self._statusBarHidden = newValue
        self.setNeedsStatusBarAppearanceUpdate()
    }
    get{
        return self._statusBarHidden
    }
}
override func prefersStatusBarHidden() -> Bool {
    return self.statusBarHidden
}
 

````