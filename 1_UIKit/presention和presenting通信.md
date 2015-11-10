## presention和presenting直接的通信

-	1：通过委托的方式，presention实例化一个交互方法的委托类，presenting的delegate指向presention

-	2：presenting直接调用presention的方法

````swift
	
	//找Controller中的xxxMethod方法，找到后调用，优先在本类中招，找不到才往上游找
	UIApplication.sharedApplication().sendAction("xxxMethod:", to: nil, from: self, forEvent: nil)

````