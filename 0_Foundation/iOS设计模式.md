## 单例模式

### objc单例标准写法
+ (instancetype)sharedManager
{
    static PhotoManager *sharedPhotoManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPhotoManager = [[PhotoManager alloc] init];
        sharedPhotoManager->_photosArray = [NSMutableArray array];
    });
    return sharedPhotoManager;
}

### swift单例标准写法

````swift

class MyManager  {
    static private let sharedInstance = MyManager()
    class var sharedManager : MyManager {
        return sharedInstance
    }
}

````


## 工厂方法

````objc
//正确
 +(instancetype)factoryA{
   return [[[self class]alloc]init];
}

//错误
+(id)factoryB{
   return [[XXXXClass alloc]init];
}
````

错误原因：
-   主要在与返回值instancetype是安全类型，能更准确推断类型
-  ```` [[XXXXClass alloc]init] ```` 在子类使用时不能返回正确的子类类型，所以需要使用 ````[[[self class]alloc]init];````  
