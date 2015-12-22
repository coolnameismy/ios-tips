//
//  MainController.m
//  myGanji
//
//  Created by 刘彦玮 on 15/1/19.
//  Copyright (c) 2015年 刘彦玮. All rights reserved.
//

#import "MainController.h"
#define LINESPACE 10

@interface MainController ()


@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect =   [[UIScreen mainScreen] bounds];
    
    
         NSLog(@"height:%f,width:%f",rect.size.height,rect.size.width);
    
     [self registKeyboardshow];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
    
    NSLog(@"clicked!!!");
    self.lable1.text =@"helloWorld";
    [self.textfield1 resignFirstResponder];

}

-(void)registKeyboardshow{
    //注册键盘关闭打开事件
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(whenKeyboardShow:) name:UIKeyboardDidShowNotification object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(whenKeyboardHide:) name:UIKeyboardDidHideNotification object:nil];
    //注册键盘按键委托
    self.textfield1.delegate = self;
    
}
-(void)whenKeyboardShow:(NSNotification*) notif{
    //获取当前键盘高度
    NSDictionary* info = notif.userInfo;
    NSValue* value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    
    //重设scrollview高度
    [self.scrollview setContentOffset:CGPointMake(0, keyboardRect.size.height)];
  
}
-(void)whenKeyboardHide:(NSNotification*) notif{
    
    
    //重设scrollview高度
    [self.scrollview setContentOffset:CGPointMake(0, -20)];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textfield1 resignFirstResponder];
    return  true;
}
@end
