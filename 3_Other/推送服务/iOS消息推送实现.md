# iOS消息推送实现

## 客户端

** 证书和权限的申请：***

-		1 ：App必须要推送权限，申请真机测试权限
-		2 ：对应的appID申请推送证书
-		3 ：使用推送证书到处P12证书给服务器使用

## 客户端代码实现：

-  1：建立我们的推送的项目（注意BundleIdentifier必须和我们推送应用的App id一致）

-  2：在AppDelegate里didFinishLaunchingWithOptions函数里写

````objc
- (BOOL)application:(UIApplication *)applicationdidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   ……
   //推送的形式：标记，声音，提示
   [[UIApplication sharedApplication] registerForRemoteNotificationTypes: UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert];
   return YES;
}

 
- (void)application:(UIApplication *)applicationdidRegisterForRemoteNotificationsWithDeviceToken:(NSData *)pToken {
   NSLog(@"regisger success:%@",pToken);
   //注册成功，将deviceToken保存到应用服务器数据库中
}
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    // 处理推送消息
    NSLog(@"userinfo:%@",userInfo);
   
    NSLog(@"收到推送消息:%@",[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]);
}
- (void)application:(UIApplication *)applicationdidFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
   NSLog(@"Registfail%@",error);
}

````

## 服务器端
> 服务端开发的思路都差不多，使用第三方封装好的包，这个包如果自己写还是很麻烦的。
> 这里以[pushSharp](https://github.com/Redth/PushSharp) 为例，一个开源的c#推送代码

关键代码说明：

````c#

var appleCert = File.ReadAllBytes(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "../../id4test_push_aps_development.p12"));//证书位置
            //IMPORTANT: If you are using a Development provisioning Profile, you must use the Sandbox push notification server 
            //  (so you would leave the first arg in the ctor of ApplePushChannelSettings as 'false')
            //  If you are using an AdHoc or AppStore provisioning profile, you must use the Production push notification server
            //  (so you would change the first arg in the ctor of ApplePushChannelSettings to 'true')
            push.RegisterAppleService(new ApplePushChannelSettings(appleCert, "WEIWEI")); //Extension method
            //Fluent construction of an iOS notification
            //IMPORTANT: For iOS you MUST MUST MUST use your own DeviceToken here that gets generated within your iOS app itself when the Application Delegate
            //  for registered for remote notifications is called, and the device token is passed back to you
            push.QueueNotification(new AppleNotification()
                                       .ForDeviceToken("cde6d75a0fc144b2bd30e10e15855376e4b53d793e6ccf9495787df19ace48d4")//手机设备token
                                       .WithAlert("Hello World!")
                                       .WithBadge(7)
                                       .WithSound("sound.caf"));
````