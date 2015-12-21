## UIViewController 添加子controller控制

````objc

//初始化
vc0 = [[SearchTableViewController alloc] init];
[self addChildViewController:vc0];
[self didMoveToParentViewController:vc0];
[self.subView addSubview:vc0.view];
currentVC = vc0;

vc1 = [[DemoDLSildeViewController alloc] init];
[self addChildViewController:vc1];

vc2 = [[Mytest1 alloc] init];
[self addChildViewController:vc2];

vc3 = [[AFDome alloc] init];
[self addChildViewController:vc3];

//使用
[self transitionFromViewController:currentVC toViewController:(vc1) duration:1.0 options:UIViewAnimationOptionAllowAnimatedContent animations:Nil completion:Nil];
[self didMoveToParentViewController:vc1];
[self.subView addSubview:vc1.view];
currentVC = vc1;

````
