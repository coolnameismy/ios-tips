

## 视图

** 重要对象介绍： **
UIScreen（屏幕）：包含 mainScreen

** 重要属性：**
bounds ,applicationFrame

````objc 
//示例
CGrect screenBounds = [[UIScreen mainScreen] bounds];//返回的是带有状态栏的Rect (0.0,0.0,320.0,480.0)
````

## UIView(画布)
应用程序视图的基本单位，可以添加子视图

## UIWindow（画框）

应用程序界面的根元素，包含许多UIView，但是其继承自UIView

````objc

示例：self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]

````
