>	SpiltViewController可以用在ios8 or later，是一个主从拆分视图结构，只在ipad和iphone6(6s)puls上可以使用。

详细介绍可以阅读这篇文章:[UISplit​View​Controller](http://nshipster.cn/uisplitviewcontroller/)

 
这里只总结几点：

-	1：split view controller导航结构建立可以通过新建项目，选择 master details模板是最快捷的方式
-	2：为什么details视图也需要加一个navigation controller？
如果不加的话，在从视图就不会有导航栏，会导致用户不清数这个是一个拆分视图，如果要触发主控制器，用户必须奇迹般的知道要去向右滑动。

当然也有一个方法可以解决它，就是使用displayModeButtonItem()方法在从视图导航栏左按钮添加一个调出主视图的按钮，方法如下：

````swift
    navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
    navigationItem.leftItemsSupplementBackButton = true
````

[demo](https://github.com/NatashaTheRobot/UISplitViewControllerDemo)