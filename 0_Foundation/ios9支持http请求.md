##ios9 回退不安全网络模式（支持http协议）

在项目中找到info.plist 源文件形式打开，添加下面内容

````
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
````

