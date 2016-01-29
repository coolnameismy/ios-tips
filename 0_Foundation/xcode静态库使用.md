## xcode静态库使用


静态库和动态库在使用上的区别

-	静态库：链接时，静态库会被完整地复制到可执行文件中， 被多次使用就有多份冗余拷贝 （左图所示）
-	动态库：链接时不复制，程序运行时由系统动态加载到内存，供程序调用，系统只加载一次，多个程序共用，节省内存 （右图所示）

使用

- 新建项目，cocoa touch static library 
- 编写代码
- 设置头文件，build phases -> New Headers phases,选择需要包含的头
- 选择设备（模拟器或者是真机）生成produceName.a文件和header文件
- 编译（选择真机设备，然后 Command+B 编译， libMJRefresh.a 文件从红色变为黑色，然后在选择模拟器Command+B）
- 使用 将 .a 、 .h 、资源文件拖拽到其他项目中即可

### 其他说明：

静态库区分真机和模拟器的库，右击 “Show In Finder” ，查看制作好的 .a 文件，里面可以看到有多个版本
-	Debug-iphoneos 文件夹里面的东西是用在真机上的
-	Debug-iphonesimulator 文件夹里面的东西是用在模拟器上的
-	如果 Scheme 是 Release 模式，生成的文件夹就以 Release 开头
-	如果想让一个 .a 文件能同时用在真机和模拟器上，需要进行合并
````
lipo -create Debug-iphoneos/xxx.a Debug-iphonesimulator/xxx.a -output xxx.a
//通过 lipo –info libMJRefresh.a 可以查看 .a 的类型（模拟器还是真机）
````



## 	参考
[http://www.cocoachina.com/ios/20150226/11182.html](http://www.cocoachina.com/ios/20150226/11182.html)

