
## 基本动画

使用animateWithDuration

````swift


 UIView.animateWithDuration(0.2, delay: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                //位置运动
                theView.frame = CGRect(x: theView.frame.origin.x+100, y: theView.frame.origin.y, width: theView.frame.size.width, height: theView.frame.height)
                //颜色渐变
                theView.backgroundColor = UIColor.greenColor()
                //透明度渐变
                theView.alpha = 0.5
            }) { (isCompletion) -> Void in
                NSLog("completion")
        }

  //

````

使用begin和commit模式示例

````swift

 //开始动画配置
    UIView.beginAnimations("view1Animation", context: nil)
    //运动时间
    UIView.setAnimationDuration(0.2)
    //设置运动开始和结束的委托 animationDidStart and animationDidStop
    UIView.setAnimationDelegate(self)
    /*
        缓动方式
        EaseInOut // slow at beginning and end
        EaseIn // slow at beginning
        EaseOut // slow at end
        Linear
    */
    UIView.setAnimationCurve(.EaseIn)
    //位置运动
    theView.frame = CGRect(x: theView.frame.origin.x+100, y: theView.frame.origin.y, width: theView.frame.size.width, height: theView.frame.height)
    //颜色渐变
    theView.backgroundColor = UIColor.greenColor()
    //透明度渐变
    theView.alpha = 0.5
    //动画开始
    UIView.commitAnimations()

````


## imageview的逐帧动画

````objc


NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"],[UIImage imageNamed:@"4"],[UIImage imageNamed:@"5"],[UIImage imageNamed:@"6"], nil];
UIImageView *image = [[UIImageView alloc]initWithFrame:self.view.frame];
image.animationImages = images;
image.animationDuration = 0.5f;
image.animationRepeatCount = 0;//无限重复
[self.view addSubview:image];
[image startAnimating];

//button旋转
[UIView animateWithDuration:2.0f animations:^{
[btn setTransform:CGAffineTransformMakeRotation(M_PI/3)];
}];


````
