>	an architecture that groups a number of private, concrete subclasses under a public, abstract superclass. （一个在共有的抽象超类下设置一组私有子类的架构）

 Class cluster 是 Apple 对抽象工厂设计模式的称呼

 class cluster 的想法很简单: 使用信息进行(类的)初始化处理期间，会使用一个抽象类（通常作为初始化方法的参数或者判定环境的可用性参数）来完成特定的逻辑或者实例化一个具体的子类。而这个"Public Facing（面向公众的）"类，必须非常清楚他的私有子类，以便在面对具体任务的时候有能力返回一个恰当的私有子类实例。对调用者来说只需知道对象的各种API的作用即可。这个模式隐藏了他背后复杂的初始化逻辑，调用者也不需要关心背后的实现。

 Class clusters 在 Apple 的Framework 中广泛使用：一些明显的例子比如 NSNumber 可以返回不同类型给你的子类，取决于 数字类型如何提供 (Integer, Float, etc...) 或者 NSArray 返回不同的最优存储策略的子类。

 这个模式的精妙的地方在于，调用者可以完全不管子类，事实上，这可以用在设计一个库，可以用来交换实际的返回的类，而不用去管相关的细节，因为它们都遵从抽象超类的方法。

** 我们的经验是使用类簇可以帮助移除很多条件语句。 **

一个经典的例子是如果你有为 iPad 和 iPhone 写的一样的 UIViewController 子类，但是在不同的设备上有不同的行为。

比较基础的实现是用条件语句检查设备，然后执行不同的逻辑。虽然刚开始可能不错，但是随着代码的增长，运行逻辑也会趋于复杂。 一个更好的实现的设计是创建一个抽象而且宽泛的 view controller 来包含所有的共享逻辑，并且对于不同设备有两个特别的子例。

通用的 view controller 会检查当前设备并且返回适当的子类。


````objc
@implementation ZOCKintsugiPhotoViewController

- (id)initWithPhotos:(NSArray *)photos
{
    if ([self isMemberOfClass:ZOCKintsugiPhotoViewController.class]) {
        self = nil;

        if ([UIDevice isPad]) {
            self = [[ZOCKintsugiPhotoViewController_iPad alloc] initWithPhotos:photos];
        }
        else {
            self = [[ZOCKintsugiPhotoViewController_iPhone alloc] initWithPhotos:photos];
        }
        return self;
    }
    return [super initWithNibName:nil bundle:nil];
}

@end

````

这个子例程展示了如何创建一个类簇。

-	使用[self isMemberOfClass:ZOCKintsugiPhotoViewController.class]防止子类中重载初始化方法，避免无限递归。当[[ZOCKintsugiPhotoViewController alloc] initWithPhotos:photos]被调用时，上面条件表达式的结果将会是True。

-	self = nil的目的是移除ZOCKintsugiPhotoViewController实例上的所有引用，实例(抽象类的实例)本身将会解除分配（ 当然ARC也好MRC也好dealloc都会发生在Main Runloop这一次的结束时）。

-	接下来的逻辑就是判断哪一个私有子类将被初始化。我们假设在iPhone上运行这段代码并且ZOCKintsugiPhotoViewController_iPhone没有重载initWithPhotos:方法。这种情况下，当执行self = [[ZOCKintsugiPhotoViewController_iPhone alloc] initWithPhotos:photos];,ZOCKintsugiPhotoViewController将会被调用，第一次检查将会在这里发生，鉴于ZOCKintsugiPhotoViewController_iPhone不完全是ZOCKintsugiPhotoViewController，表达式[self isMemberOfClass:ZOCKintsugiPhotoViewController.class]将会是False,于是就会调用[super initWithNibName:nil bundle:nil]，于是就会进入ZOCKintsugiPhotoViewController的初始化过程，这时候因为调用者就是ZOCKintsugiPhotoViewController本身，这一次的检查必定为True,接下来就会进行正确的初始化过程。(NOTE：这里必须是完全遵循Designated initializer 以及Secondary initializer的设计规范的前提下才会其效果的!不明白这个规范的可以后退一步熟悉这种规范在回头来看这个说明)