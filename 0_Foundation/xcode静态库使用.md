## xcode静态库使用

````
注意：
1静态库的编译是区分模拟器版本和真机版本的！
2项目中如果使用了自制的动态库，不能被上传到 AppStore!
````

- 新建项目，cocoa touch static library 
- 编写代码
- 选择设备（模拟器或者是真机）生成produceName.a文件和header文件
- 导入项目
- 将.a文件拖入到项目中，并拖入.h头文件


==================================================
[http://www.cocoachina.com/ios/20150226/11182.html](http://www.cocoachina.com/ios/20150226/11182.html)

