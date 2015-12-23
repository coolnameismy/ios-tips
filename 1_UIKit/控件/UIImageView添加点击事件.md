## UIImageView添加点击事件

````objc
image.userInteractionEnabled = YES;//it is very improtant!!!
[image addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headportraitClicked)]];
````
