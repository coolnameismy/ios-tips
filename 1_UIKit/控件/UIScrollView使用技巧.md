##  UIScrollView使用技巧

1:IndicatorInsets	

指定滚动条在scrollerView中的位置

该属性设置为0时显示滚动条，设置为最大值时候不显示滚动条，当然也可以通过scrollView.showsVerticalScrollIndicator去设置

2:contentInset 这个能指定scroll可以滚动的高度或者是宽度

3:若遇到一个很长的页面，xib无法正常拖控件时，可以用scroll解决，步骤如下（以1000点为例）：

－ 设置view第四栏的属性 size 改为freeform ，并将view高度改为实际页面的高度为1000
－ 设置scrollview的高度改为1000，IndicatorInsets和contentInset都为1000
－ 这个时候就可以看见页面本来不可编辑的位置，编辑控件
－ 发布时，只需要把scrollview的height改回到568就可以了

## 属性列表

````objc
CGPoint contentOffSet	监控目前滚动的位置
CGSize contentSize	滚动范围的大小
UIEdgeInsets contentInset	视图在scrollView中的位置
id<UIScrollerViewDelegate>
delegate	设置协议
BOOL directionalLockEnabled	指定控件是否只能在一个方向上滚动
BOOL bounces	控制控件遇到边框是否反弹
BOOL alwaysBounceVertical	控制垂直方向遇到边框是否反弹
BOOL alwaysBounceHorizontal	控制水平方向遇到边框是否反弹
BOOL pagingEnabled	控制控件是否整页翻动
BOOL scrollEnabled	控制控件是否能滚动
BOOL showsHorizontalScrollIndicator	控制是否显示水平方向的滚动条
BOOL
showsVerticalScrollIndicator	控制是否显示垂直方向的滚动条
UIEdgeInsets scrollIndicatorInsets	指定滚动条在scrollerView中的位置
UIScrollViewIndicatorStyle
indicatorStyle	设定滚动条的样式
float decelerationRate	改变scrollerView的减速点位置
BOOL tracking	监控当前目标是否正在被跟踪
BOOL dragging	监控当前目标是否正在被拖拽
BOOL decelerating	监控当前目标是否正在减速
BOOL delaysContentTouches	控制视图是否延时调用开始滚动的方法
BOOL canCancelContentTouches	控制控件是否接触取消touch的事件
float minimumZoomScale	缩小的最小比例
float maximumZoomScale	放大的最大比例
float zoomScale	设置变化比例
BOOL bouncesZoom	控制缩放的时候是否会反弹
BOOL zooming	判断控件的大小是否正在改变
BOOL zoomBouncing	判断是否正在进行缩放反弹
BOOL scrollsToTop	控制控件滚动到顶部
````
