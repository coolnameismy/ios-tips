## UINavigationController使用


````objc

 //初始化
 ViewController1 *rootVC = [[ViewController1 alloc]initWithNibName:@"ViewController1" bundle:nil];
 UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:rootVC];
 self.window.rootViewController = navigationController;

 //页面跳转 
modal ：pushViewController
normal:presentViewController 
 
[self.navigationController presentViewController:[[ModalViewController alloc]init] animated:(YES) completion:^(void){  }];
 //passValue  by using NSNotificationCenter 1:setp register Notification   
[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(backValue:) name:@"postback" object:nil];
// selector
- (void)backValue:(NSDictionary *)dict {
    NSLog(@"%@",dict);
}

//jump back!
- (IBAction)goback:(id)sender {
    
    [self dismissViewControllerAnimated:(YES) completion:^(void){
        //NSLog(@"dismiss");
        //回传值
        NSDictionary *dict = [NSDictionary dictionaryWithObject:@"liuyanwei" forKey:@"name"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"postback" object:dict];
        
    }];
}
//jump to rootController
[vc.navigationController popToRootViewControllerAnimated:YES];

//导航栏图标按钮组
UIButton *leftbutton= [UIButton buttonWithType:UIButtonTypeSystem];
leftbutton.titleLabel.text = @"123";
leftbutton.backgroundColor = [UIColor redColor];
leftbutton.frame =CGRectMake(0, 0, 30, 30);
//[leftbutton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
//[leftbutton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
UIBarButtonItem *leftButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftbutton];
self.navigationItem.leftBarButtonItem=leftButtonItem;

self.navigationItem.rightBarButtonItem=nil;
UIButton *rightbutton1=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//[rightbutton1 setImage:[UIImage imageNamed:@"market_new"] forState:UIControlStateNormal];
rightbutton1.backgroundColor = [UIColor redColor];
[rightbutton1 addTarget:self action:@selector(rightTarget1:) forControlEvents:UIControlEventTouchUpInside];
UIBarButtonItem *rightButtonItem1=[[UIBarButtonItem alloc] initWithCustomView:rightbutton1];
UIButton *rightbutton2=[[UIButton alloc] initWithFrame:CGRectMake(0, 35, 30, 30)];
//[rightbutton2 setImage:[UIImage imageNamed:@"filterIcon"] forState:UIControlStateNormal];
rightbutton2.backgroundColor = [UIColor purpleColor];
[rightbutton2 addTarget:self action:@selector(rightTarget2:) forControlEvents:UIControlEventTouchUpInside];
UIBarButtonItem *rightButtonItem2=[[UIBarButtonItem alloc] initWithCustomView:rightbutton2];
self.navigationItem.rightBarButtonItems=@[rightButtonItem1, rightButtonItem2];
````
