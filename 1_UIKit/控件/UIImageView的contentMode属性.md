##  UIImageView 的contentMode属性

````objc

UIViewContentModeScaleToFill

UIViewContentModeScaleAspectFit

UIViewContentModeScaleAspectFill

UIViewContentModeRedraw

UIViewContentModeCenter

UIViewContentModeTop

UIViewContentModeBottom

UIViewContentModeLeft

UIViewContentModeRight

UIViewContentModeTopLeft

UIViewContentModeTopRight

UIViewContentModeBottomLeft

UIViewContentModeBottomRight

````

## 注意

-  凡是没有带Scale的，当图片尺寸超过ImageView尺寸时，只有部分显示在ImageView中
-  UIViewContentModeScaleToFill属性会导致图片变形。UIViewContentModeScaleAspectFit会保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。UIViewContentModeScaleAspectFill也会证图片比例不变，但是是填充整个ImageView的，可能只有部分图片显示出来。
