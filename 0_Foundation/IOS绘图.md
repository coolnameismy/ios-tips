
## Path:路径
````objc
//指定当前点为 current point，Quartz会跟踪current point一般执行完一个相关函数后，current point都会相应的改变。
CGContextMoveToPoint (
    CGContextRef c,
    CGFloat x,
    CGFloat y
);

Lines：线
//从当前点 画到点,current point 会变化
void CGContextAddLineToPoint (
    CGContextRef c,
    CGFloat x,
    CGFloat y
);

//添加多个路径
void CGContextAddLines (
CGContextRef c,
const CGPoint points[],
size_t count
);
````

## Arcs：弧线

````objc
void CGContextAddArc (
    CGContextRef c,    
    CGFloat x,             //圆心的x坐标
    CGFloat y,    //圆心的x坐标
    CGFloat radius,   //圆的半径 
    CGFloat startAngle,    //开始弧度
    CGFloat endAngle,   //结束弧度
    int clockwise          //0表示顺时针，1表示逆时针
 );

void CGContextAddArcToPoint(
	CGContextRef c, 
	CGFloat x1,  //端点1的x坐标
    CGFloat y1,  //端点1的y坐标
    CGFloat x2,  //端点2的x坐标
    CGFloat y2,  //端点2的y坐标
    CGFloat radius //半径
)；

Curves 
 三次曲线函数
 void CGContextAddCurveToPoint (
    CGContextRef c,
    CGFloat cp1x, //控制点1 x坐标
    CGFloat cp1y, //控制点1 y坐标
    CGFloat cp2x, //控制点2 x坐标
    CGFloat cp2y, //控制点2 y坐标
    CGFloat x,  //直线的终点 x坐标
    CGFloat y  //直线的终点 y坐标
 );

 二次曲线函数
 void CGContextAddQuadCurveToPoint (
    CGContextRef c,
    CGFloat cpx,  //控制点 x坐标
    CGFloat cpy,  //控制点 y坐标
    CGFloat x,  //直线的终点 x坐标
    CGFloat y  //直线的终点 y坐标
 );

````


## 画椭圆，矩形

````objc
void CGContextAddEllipseInRect (
    CGContextRef context,
    CGRect rect  //一矩形
);

void CGContextAddRect (
	CGContextRef c,
	CGRect rect
); 

````


## Path：路径

````objc
CGContextMoveToPoint设置起点
CGContextClosePath 连接起点和当前点
CGPathCreateMutable 类似于 CGContextBeginPath
CGPathMoveToPoint 类似于 CGContextMoveToPoint
CGPathAddLineToPoint 类似于 CGContextAddLineToPoint
CGPathAddCurveToPoint 类似于 CGContextAddCurveToPoint
CGPathAddEllipseInRect 类似于 CGContextAddEllipseInRect
CGPathAddArc 类似于 CGContextAddArc
CGPathAddRect 类似于 CGContextAddRect
CGPathCloseSubpath 类似于 CGContextClosePath
CGContextAddPath函数把一个路径添加到graphics 

路径填充和描边：
Stroking ：画出路径
Filling ：填充路径的封闭区域

路径和填充的效果
 
//配置样式
//笔触颜色
CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
//笔触宽度
CGContextSetLineWidth(context, 20);
//join 拐点样式
//    enum CGLineJoin {
//        kCGLineJoinMiter, //尖的，斜接
//        kCGLineJoinRound, //圆
//        kCGLineJoinBevel //斜面
//    };
CGContextSetLineJoin(context, kCGLineJoinRound);

//Line cap 线的两端的样式
//    enum CGLineCap {
//        kCGLineCapButt,
//        kCGLineCapRound,
//        kCGLineCapSquare
//    };
CGContextSetLineCap(context, kCGLineCapSquare);

//虚线线条样式
CGFloat lengths[] = {10,10};
CGContextSetLineDash(context, 0, lengths, 2);



//路径填充

CGContextStrokePath(ctx); //描出路径
CGContextFillPath(ctx)  使用非零绕数规则填充当前路径
CGContextDrawPath	 两个参数决定填充规则，kCGPathFill表示用非零绕数规则，kCGPathEOFill表示用奇偶规则，kCGPathFillStroke表示填充，kCGPathEOFillStroke表示描线，不是填充
CGContextEOFillPath	 使用奇偶规则填充当前路径
CGContextFillRect	 填充指定的矩形
CGContextFillRects	 填充指定的一些矩形
CGContextFillEllipseInRect	 填充指定矩形中的椭圆

````

## 参考

ios绘图基础
http://liuyanwei.jumppo.com/2015/07/25/ios-draw-base.html


ios绘图demo,做一个涂鸦板(上)
http://liuyanwei.jumppo.com/2015/07/26/ios-draw-Graffiti.html

ios绘图demo,做一个涂鸦板(下)
http://liuyanwei.jumppo.com/2015/09/02/ios-draw-Graffiti-2.html

IOS绘制圆,直线,弧线,矩形,扇形,三角形,贝塞尔等图形:
http://blog.csdn.net/chocolateloveme/article/details/17246887

IOS开发UI篇—Quartz2D使用（绘图路径）
http://www.cnblogs.com/wendingding/p/3782679.html

Paths
http://donbe.blog.163.com/blog/static/138048021201052093633776/	

IOS 使用Quartz 2D画虚线
http://blog.csdn.net/zhangao0086/article/details/7234859