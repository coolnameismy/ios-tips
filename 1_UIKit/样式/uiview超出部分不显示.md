##  uiview超出部分不显示的三种方式

````objc

1: [self.view setClipsToBounds:YES];

2: [self.view.layer setMasksToBounds:YES];

3: 在故事板或者是xib界面，选择UIView 在 attributes 那一栏选择 Clip to subview

````
