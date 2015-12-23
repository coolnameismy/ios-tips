
# facebook/pop的使用

## 1：安装

````
pod 'pop', '~> 1.0'
#import <pop/POP.h>
````

## 步骤 2:创建动效

使用POP可以创建4类动效：: spring, decay, basic and custom.

````objc 
Spring （弹性）动效可以赋予物体愉悦的弹性效果
POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];

Decay （衰减) 动效可以用来逐渐减慢物体的速度至停止
POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionX];

Basic（基本）动效可以在给定时间的运动中插入数值调整运动节奏
POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];

Custom（自定义）动效可以让设计值创建自定义动效，只需简单处理CADisplayLink，并联系时间-运动关系
在这片简短教程中将不涵盖自定义动效，大家可以看看POP的Github来获取更多进阶知识https://github.com/facebook/pop

````

## 步骤3: 给动效添加属性

````
Pop 让我们可以这样设置动效的属性:

velocity : anim.velocity = @(1000.);

fromValue: anim.fromValue = @(0.0);

toValue: anim.toValue = @(1.0);

bounciness: anim.springBounciness = 10;

````

## 步骤4 :动起来

若想让物体动起来，只需要添加步骤3所创建的东西到视图。

````objc
[self.yourView.layer pop_addAnimation:anim forKey:@"typeANameForYourAnimationHere"];
这就是POP简单创建动效的教程。大家可以看看例子来理解如何创建动效。争取努力变得技艺纯熟吧。
````


## 动效案例

````objc

///这个动效将按钮缩小到一半
-(void)scale {
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(0.7, 0.7)];
    scaleAnimation.springBounciness = 10.f;
    [self.Button.layer pop_addAnimation:scaleAnimation forKey:@"scaleAnim"];
}


///这个动效将按钮旋转
-(void)rotaion {
    POPSpringAnimation *rotationAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnimation.beginTime = CACurrentMediaTime() + 0.2;
    rotationAnimation.toValue = @(1.2);
    rotationAnimation.springBounciness = 10.f;
    rotationAnimation.springSpeed = 3;
    [self.Button.layer pop_addAnimation:rotationAnimation forKey:@"rotationAnim"];
}

//这个改变透明度：
-(void)Alpha {
    POPBasicAnimation *opacityAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    opacityAnimation.toValue = @(0.5);
    [self.Button.layer pop_addAnimation:opacityAnimation forKey:@"opacityAnimation"];
}


````
Pop Github : https://github.com/facebook/pop

Popping -Pop案例 : https://github.com/schneiderandre/popping

POP使用教程: https://github.com/maxmyers/FacebookPop

