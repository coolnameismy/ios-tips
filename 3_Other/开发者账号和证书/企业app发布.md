##	步骤

-	1：app绑定企业证书
-	2：生成ipa和manifest.plist文件
-	3：创建html连接，链接地址：itms-services://?action=download-manifest&url=https://xxx.com/apps/xxx.plist

例如：
````
<a href="itms-services://?action=download-manifest&url=https://mydomain.com/apps/MyInHouseApp.plist" id="text">Install the In-House App</a> 
````

##  注意
-	生成连接时候需要四个个文件，分别是两个image和一个ipa，manifest文件 必须发布在https协议的域名下
-	图片尺寸为：512x512 和 57x57

## 参考连接
-	[在企业内部分发 iOS 应用程序](http://www.cocoachina.com/industry/20140818/9401.html)
-	[iOS企业开发In House ipa发布流程](http://wenku.baidu.com/link?url=YzJkCMo8HggUbH-UGi6GVAa-_FuYavSG5C2eRPLLDXe6cZDmi5QbLg1HJuSUTcpfa6_MQVDtLO5AY9nS_4XjNXNEFDUvHnFqS_e7L-LKmEW)