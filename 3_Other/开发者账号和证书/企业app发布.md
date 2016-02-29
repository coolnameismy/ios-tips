##	步骤

-	1：app绑定企业证书
-	2：生成ipa和manifest.plist文件
-	3：创建html连接，链接地址：itms-services://?action=download-manifest&url=https://xxx.com/apps/xxx.plist

过程网上很多，可以参考：最下方的参考

例如：
````
<a href="itms-services://?action=download-manifest&url=https://mydomain.com/apps/MyInHouseApp.plist" id="text">Install the In-House App</a> 
````


##  注意
-	生成连接时候需要四个个文件，分别是两个image和一个ipa，manifest文件 必须发布在https协议的域名下
-	图片尺寸为：512x512 和 57x57
-	manifest.plist中ipa文件下载的地址必须使用http，而图片和manifest.plist文件则必须使用https地址（待验证）
-	https用的如果是自制证书，需要客户端先安装自制证书的.cer文件后才能正常下载安装ipa，否则会提示：无法连接到www.xx.com
-	企业证书安装后用户首次打开时候必须点击授信，否则就需要到设置里面去设置证书授信，参考：[未受信任的企业级开发者](http://jingyan.baidu.com/article/335530da83801c19cb41c39f.html)
 

##  参考内容

-	[在企业内部分发 iOS 应用程序](http://www.cocoachina.com/industry/20140818/9401.html)
-	[iOS企业开发In House ipa发布流程](http://wenku.baidu.com/link?url=YzJkCMo8HggUbH-UGi6GVAa-_FuYavSG5C2eRPLLDXe6cZDmi5QbLg1HJuSUTcpfa6_MQVDtLO5AY9nS_4XjNXNEFDUvHnFqS_e7L-LKmEW)

