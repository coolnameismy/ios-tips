## IOS 真机调试

-  1：注册手机 uuid
选择Devices ，按步骤输入数据。

-  2：创建Identifiers
输入Identifiers 选择权限

-  3：创建电脑调试的证书 Certificates
根据自己电脑的钥匙串生成开发电脑需要的Certificates

-  4: 创建手机调试的证书  Provisioning Profiles
根据申请好的，Identifiers，选择可以调试的电脑和设备，其实就是把开发环境和开发设备已经Identifiers三者进行绑定

-  5: 推送和证书多机器开发需要用到.p12证书，导出方式:
选择 钥匙串 -> 左侧选择登陆和我的证书 ->右侧找到相应的证书后右键点击 -> 导出 -> 选择.p12

## 参考网站

[iOS开发：创建真机调试证书](http://jingyan.baidu.com/article/ff411625b8141312e48237a7.html)
