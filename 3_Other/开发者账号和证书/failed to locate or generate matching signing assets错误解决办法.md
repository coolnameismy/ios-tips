
![](./4F9EFDD7-E466-4BE3-8A50-DDC42C91E7E7)

## failed to locate or generate matching signing assets错误解决办法

1，按照你那个链接下载，[https://developer.apple.com/certificationauthority/AppleWWDRCA.cer](https://developer.apple.com/certificationauthority/AppleWWDRCA.cer)，并安装。

2， 在“钥匙串”里选择“登录”,然后点选“证书”，在这个界面，选择工具栏的“显示” -> “显示过期证书”，这时候你会发现一个过期的“WWDR Certificate”（Apple Worldwide Developer Relations Certification Authority），删除它。

3， 在“系统”的那一栏也有这个过期的“WWDR Certificate”，一并删除它。

4 ，不出意外你的证书那里从 “This certificate has an invalid issuer”（此证书的签发者无效）变成了 “This certificate is valid”了。