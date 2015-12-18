##  从本地plist文件中加载数据

````objc

 	//user code
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"event" ofType:@"plist"];
    //获取本地文件列表  NSArray
    events = [[NSArray alloc] initWithContentsOfFile:plistPath];

````