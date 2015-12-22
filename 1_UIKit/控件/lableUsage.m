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
    
    //设置lable样式
    //设置位置和大小
    self.myLable2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 640, 400)];
    NSString *string = @"sadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsaadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsaadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsdasadsadsadsadsadsadsda";
    //设置多行显示
    self.myLable2.lineBreakMode = NSLineBreakByWordWrapping;
    self.myLable2.numberOfLines = 0;
    //设置行间距
    NSMutableAttributedString *attrbutedString = [[NSMutableAttributedString alloc]initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:LINESPACE];
    [attrbutedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    self.myLable2.attributedText  =  attrbutedString;

    
    [self.view addSubview:self.myLable2];
}


@end
