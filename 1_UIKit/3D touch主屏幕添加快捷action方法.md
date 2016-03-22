>	主要有2种方法，通过.plist声明和代码实现。

##  .plist声明


````
<key>UIApplicationShortcutItems</key>
 <array>
     <dict>
       <!--标题-->
       <key>UIApplicationShortcutItemTitle</key>
       <string>New Message</string>
       <!--副标题-->
       <key>UIApplicationShortcutItemSubtitle</key>
       <string>open-favorites</string>
       <!--使用系统图标类型-->
       <key>UIApplicationShortcutItemIconType</key>
       <string>UIApplicationShortcutIconTypeCompose</string>
       <!--  选项自定义icon-->
       <!-- <key>UIApplicationShortcutItemIconFile</key>
        <string></string>--><!-- icon文件的路径，必须使用项目内的资源文件 -->
       <!--  app应用标识-->
       <key>UIApplicationShortcutItemType</key>
       <string>com.mycompany.myapp.newmessage</string>
       <!--  可以用来传递一些数据-->
       <key>UIApplicationShortcutItemUserInfo</key>
       <dict>
         <key>key2</key>
         <string>value2</string>
       </dict>
     </dict>
     <dict>
       <key>UIApplicationShortcutItemIconFile</key>
       <string>open-favorites</string>
       <key>UIApplicationShortcutItemTitle</key>
       <string>Favorites</string>
       <key>UIApplicationShortcutItemType</key>
       <string>com.mycompany.myapp.openfavorites</string>
       <key>UIApplicationShortcutItemUserInfo</key>
       <dict>
         <key>key1</key>
         <string>value1</string>
       </dict>
     </dict>
   </array>
````


## 代码动态实现示例

````swift
  //动态注册Home Screen Quick Actions
  func registHomeScreenQuickActions(){
    let item1 = UIApplicationShortcutItem(type: "com.mycompany.myapp.newmessage",
                                localizedTitle: "title",
                             localizedSubtitle: "subtitle",
                                          icon: UIApplicationShortcutIcon(type: .Home),
                                      userInfo: nil);

    UIApplication.sharedApplication().shortcutItems = [item1];
  }

````

## 获取启动入口和参数

想要接收3d touch启动点击的选项和配置的上下文数据，可以在 ` AppDelegate ` 中实现委托  ` application  performActionForShortcutItem ` 例如：

````swift
  //接收Home Screen Quick Actions启动参数
  func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
      NSLog("%@", shortcutItem);
      if let userInfo = shortcutItem.userInfo {
        NSLog("userinfo:%@", userInfo);
      }
  }
````
