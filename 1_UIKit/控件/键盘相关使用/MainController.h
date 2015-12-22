//
//  MainController.h
//  myGanji
//
//  Created by 刘彦玮 on 15/1/19.
//  Copyright (c) 2015年 刘彦玮. All rights reserved.
//

#import "ViewController.h"

@interface MainController : ViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lable1;
@property (weak, nonatomic) IBOutlet UITextField *textfield1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)buttonClick:(id)sender;


@end
