## tabbar和navigation混用

````objc

//初始化uitabbar
UITabBarController *tabBarController =  [[UITabBarController alloc]init];

ViewController1 *vc1 = [[ViewController1 alloc]init];
UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:vc1];
ViewController2 *vc2 = [[ViewController2 alloc]init];
ViewController3 *vc3 = [[ViewController3 alloc]initWithNibName:@"View" bundle:nil];
ViewController4 *vc4 = [[ViewController4 alloc]init];
ViewController5 *vc5 = [[ViewController5 alloc]init];
ViewController6 *vc6 = [[ViewController6 alloc]init];
tabBarController.viewControllers = [NSArray arrayWithObjects:navc,vc2,vc3,vc4,vc5,vc6,nil];
//配置uitabbar按钮样式
vc1.tabBarItem.title = @"1";
vc2.tabBarItem.title = @"2";
vc3.tabBarItem.title = @"3";
vc4.tabBarItem.title = @"4";
vc5.tabBarItem.title = @"5";
vc6.tabBarItem.title = @"6";
vc1.tabBarItem.image = [UIImage imageNamed:@"cbxx"];
vc2.tabBarItem.image = [UIImage imageNamed:@"clwz"];
vc3.tabBarItem.image = [UIImage imageNamed:@"gjjxx"];
vc4.tabBarItem.image = [UIImage imageNamed:@"hmxx"];
vc5.tabBarItem.image = [UIImage imageNamed:@"jsywz"];
vc6.tabBarItem.image = [UIImage imageNamed:@"rqxx"];
vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"cbxx1"];
vc2.tabBarItem.selectedImage = [UIImage imageNamed:@"clwz1"];
vc3.tabBarItem.selectedImage = [UIImage imageNamed:@"gjjxx1"];
vc4.tabBarItem.selectedImage = [UIImage imageNamed:@"hmxx1"];
vc5.tabBarItem.selectedImage = [UIImage imageNamed:@"jsywz1"];
vc6.tabBarItem.selectedImage = [UIImage imageNamed:@"rqxx1"];
//配置badge徽章
vc1.tabBarItem.badgeValue = @"10";
vc4.tabBarItem.badgeValue = @"hi";
//tabbar入栈
self.self.window.rootViewController =tabBarController;
````
