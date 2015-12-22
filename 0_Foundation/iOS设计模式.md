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
