//
//  MainController.m
//  myGanji
//
//  Created by 刘彦玮 on 15/1/19.
//  Copyright (c) 2015年 刘彦玮. All rights reserved.
//

    
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
    
    //动态计算uilabel的宽高，这里以高度为例
     UILabel *textcontent = [[UILabel alloc]init];
    textcontent.text = @"新的一年，希望家人和朋友都身体健康，工作顺利，心想事成新的一年，希望家人和朋友都身体健康，工作顺利，心想事成~~新的一年，希望家人和朋友都身体健康，工作顺利，心想事成新的一年，希望家人和朋友都身体健康，工作顺利，心想事成~~";
    textcontent.textColor = [UIColor blackColor];
    textcontent.font = [UIFont systemFontOfSize:12];
    textcontent.lineBreakMode = NSLineBreakByWordWrapping;
    textcontent.numberOfLines = 0;
    CGSize size = CGSizeMake(260, CGFLOAT_MAX);//宽度，最大高度值
    CGSize contentsize = [textcontent.text sizeWithFont:textcontent.font constrainedToSize:size lineBreakMode:textcontent.lineBreakMode];
    textcontent.frame = CGRectMake(60, 40, contentsize.width, contentsize.height);
    [textcontent setBackgroundColor:[UIColor grayColor]];
    [self.contentView addSubview:textcontent];