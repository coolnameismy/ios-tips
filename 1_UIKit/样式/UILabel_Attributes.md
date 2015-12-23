

## 1.NSKernAttributeName:
10 调整字句 kerning 字句调整
 
## 2.NSFontAttributeName :
[UIFont systemFontOfSize:_fontSize] 设置字体
 

## 3.NSForegroundColorAttributeName
:[UIColor redColor] 设置文字颜色
 

## 4.NSParagraphStyleAttributeName :
paragraph 设置段落样式
NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
paragraph.alignment = NSTextAlignmentCenter;
 

## 6.NSBackgroundColorAttributeName:
[UIColor blackColor] 设置背景颜色
 

## 7.NSStrokeColorAttributeName
设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心.
NSStrokeWidthAttributeName这个属性所对应的值是一个 NSNumber 对象(小数)。该值改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0。

同时设置了空心的两个属性，并且NSStrokeWidthAttributeName属性设置为整数，文字前景色就无效果了

## 8. NSStrikethroughStyleAttributeName 添加删除线，strikethrough删除线

## 9. NSUnderlineStyleAttributeName 添加下划线

## 10. NSShadowAttributeName 设置阴影，单独设置不好使，必须和其他属性搭配才好使

## 11.NSVerticalGlyphFormAttributeName
该属性所对应的值是一个 NSNumber 对象(整数)。0 表示横排文本。1 表示竖排文本。在 iOS 中，总是使用横排文本，0 以外的值都未定义。

## 12. NSObliquenessAttributeName设置字体倾斜。

## 13. NSExpansionAttributeName 设置文本扁平化

参考：http://www.cnblogs.com/qingche/p/3574995.html
