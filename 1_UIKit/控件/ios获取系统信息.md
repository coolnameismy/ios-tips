
## app版本号

````objc
+(NSString *)appVersion{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    NSString *name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSString *build = [infoDictionary objectForKey:@"CFBundleVersion"];
//    NSString *label = [NSString stringWithFormat:@"%@ v%@ (build %@)", name, version, build];

    return version;
}
@end

````

    
## 其他信息

````objc

    NSString* identifierNumber = [[UIDevice currentDevice] uniqueIdentifier]; 
    NSLog(@"手机序列号: %@",identifierNumber); 
    //手机别名： 用户定义的名称  
    NSString* userPhoneName = [[UIDevice currentDevice] name]; 
    NSLog(@"手机别名: %@", userPhoneName); 
    //设备名称  
    NSString* deviceName = [[UIDevice currentDevice] systemName]; 
    NSLog(@"设备名称: %@",deviceName ); 
    //手机系统版本  
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion]; 
    NSLog(@"手机系统版本: %@", phoneVersion); 
    //手机型号  
    NSString* phoneModel = [[UIDevice currentDevice] model]; 
    NSLog(@"手机型号: %@",phoneModel ); 
    //地方型号  （国际化区域名称）  
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel]; 
    NSLog(@"国际化区域名称: %@",localPhoneModel ); 
     
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary]; 
    // 当前应用名称  
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"]; 
    NSLog(@"当前应用名称：%@",appCurName); 
    // 当前应用软件版本  比如：1.0.1  
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"]; 
    NSLog(@"当前应用软件版本:%@",appCurVersion); 
    // 当前应用版本号码   int类型  
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"]; 
    NSLog(@"当前应用版本号码：%@",appCurVersionNum); 

    //手机序列号
    NSString* identifierNumber = [[UIDevice currentDevice] uniqueIdentifier];
    NSLog(@"手机序列号: %@",identifierNumber);
    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    NSLog(@"手机别名: %@", userPhoneName);
    //设备名称
    NSString* deviceName = [[UIDevice currentDevice] systemName];
    NSLog(@"设备名称: %@",deviceName );
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"手机系统版本: %@", phoneVersion);
    //手机型号
    NSString* phoneModel = [[UIDevice currentDevice] model];
    NSLog(@"手机型号: %@",phoneModel );
    //地方型号  （国际化区域名称）
    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    NSLog(@"国际化区域名称: %@",localPhoneModel );
   
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // 当前应用名称
    NSString *appCurName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    NSLog(@"当前应用名称：%@",appCurName);
    // 当前应用软件版本  比如：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"当前应用软件版本:%@",appCurVersion);
    // 当前应用版本号码   int类型
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    NSLog(@"当前应用版本号码：%@",appCurVersionNum);

````
