##	Xcode因为证书问题常见错误

### ![](http://upload-images.jianshu.io/upload_images/200100-3a8214825f9927f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Could not launch "xxxxxx"

>	process launch failed : security

确认下证书是不是开发证书，如果是发布证书就会出现这样的提示。


###	![](http://upload-images.jianshu.io/upload_images/200100-1a8238279a068561.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

证书失效了，去开发者中心重新生成一个

### ![](http://upload-images.jianshu.io/upload_images/200100-5a52f5d070a03ff4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

包标识符不与描述文件包含的包标识符不一致，按照它的提示换一下就好了，最好不要点 Fix Issue，点完后 Xcode 会自己生成一个包含统配包标识符的描述文件，并且 Remove 已经生成好的描述文件。会影响整个团队的合作。


###	process launch failed: timed out trying to launch app

还是描述文件的问题，把发布的描述文件或者是 hoc 的描述文件当成开发描述文件使用了。stackoverflow的解释

###	This application's application-identifier entitlement does not match that of the installed application. These values must match for an upgrade to be allowed.

iPhone上已经装了包标识符一样的 App，删掉再运行。


###	没有找到报错的的图片和提示，我来描述一下那个情况：就是从开发者网站直接下载一个开发证书，然后选择了对应的描述文件，但是Xcode却不能选择那个下载的开发证书，然后如果运行会报错。原因是直接下载的开发证书不在在你机器上生成的，这时应该做的就是让生成证书的那个同学给你导出一个 p12 文件的开发证书，和证书的key，也是 p12 文件。或者你再申请一个开发者证书，再生成一个描述文件。


## 参考

[Xcode因为证书问题经常报的那些错](http://www.jianshu.com/p/b10680a32d35)