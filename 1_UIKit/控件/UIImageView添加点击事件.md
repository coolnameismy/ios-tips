## UIImageView添加点击事件

````objc
image.userInteractionEnabled = YES;//it is very improtant!!!
[image addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headportraitClicked:)]];
````

## 获取调用手势的uiview

````objc
(void)btnClicked:(UITapGestureRecognizer *)sender{
    UIButton *btn = (UIButton *)sender.view;
}
````