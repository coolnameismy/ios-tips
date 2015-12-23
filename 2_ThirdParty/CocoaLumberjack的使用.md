
## CocoaLumberjack的使用


1：准备 

````objc
platform :ios, '5.0'
pod 'CocoaLumberjack'
````

2:项目配置

````objc
#import <CocoaLumberjack/CocoaLumberjack.h>

----一共有5种不同等级--------
Error
Warn
Info
Debug
Verbose

applicationDidFinishLaunching中添加
[DDLog addLogger:[DDASLLogger sharedInstance]];
[DDLog addLogger:[DDTTYLogger sharedInstance]];
//全局配置显示的告警级别（）
# [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelError];
# [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelWarning];

```


 
 3:配置log显示的颜色

````objc

- 彩色日志显示需要插件XcodeColors插件支持，我安装的是：https://github.com/rvi/XcodeColors
- Demo里测试日志颜色正常，在自己的项目里就不会显示颜色
在xcode导航选择 project -》 scheme -》 run -》 Arguments
add new  Environment Variable named "XcodeColors", with a value of "YES"

- 默认的颜色是error是红色字体，waring是黄色字体，其他都是黑色字体，你也可以自定义颜色。

[[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:1.000 green:0.000 blue:0.502 alpha:1.000] forFlag:DDLogFlagError];
[[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000] forFlag:DDLogFlagWarning];
[[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:0.000 green:0.251 blue:0.502 alpha:1.000] forFlag:DDLogFlagInfo];
[[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor blackColor] forFlag:DDLogFlagDebug];
//[[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:[UIColor greenColor] forFlag:DDLogFlagVerbose];

````



4：示例：

````objc

PrefixHeader_pch
#import <CocoaLumberjack/CocoaLumberjack.h>

AppDelegate.h
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    [self DDLogConfiguration];
    return YES;
}
//DDLog配置
-(void) DDLogConfiguration{
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:1.000 green:0.000 blue:0.502 alpha:1.000] forFlag:DDLogFlagError];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000] forFlag:DDLogFlagWarning];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor colorWithRed:0.000 green:0.251 blue:0.502 alpha:1.000] forFlag:DDLogFlagInfo];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor whiteColor] backgroundColor:[UIColor blackColor] forFlag:DDLogFlagDebug];
    //      [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:[UIColor greenColor] forFlag:DDLogFlagVerbose];
    
    //允许颜色
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    //[DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelError];
    //[DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelWarning];
   
}

ViewController.h==============
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DDLogError(@"DDLogError");
    DDLogWarn(@"DDLogWarn");
    DDLogInfo(@"DDLogInfo");
    DDLogDebug(@"DDLogDebug");
    DDLogVerbose(@"DDLogVerbose");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

````
