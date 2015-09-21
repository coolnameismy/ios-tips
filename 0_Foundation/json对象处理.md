

## json 转 NSObject 和 NSObject转json

````objc
//1：对象需要实现NSCoding协议
- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.pwd forKey:@"pwd"];
    [aCoder encodeObject:self.headerPortaitUrl forKey:@"headerPortaitUrl"];
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self.uid = [aDecoder decodeObjectForKey:@"uid"];
    self.pwd = [aDecoder decodeObjectForKey:@"pwd"];
    self.headerPortaitUrl = [aDecoder decodeObjectForKey:@"headerPortaitUrl"];
    return self;
}

//2：转json和转object
NSData *data= [NSKeyedArchiver archivedDataWithRootObject:[UserInfo sharedUserInfo]];
[[self userDefaults] setObject:data forKey:@"userinfo"];
[[self userDefaults] synchronize];

NSData *cacheData = [[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo" ];
UserInfo *cacheUserinfo= [NSKeyedUnarchiver unarchiveObjectWithData:cacheData];

````

## json 转 NSArray 和 NSDictionary

````objc

var json1="{\"中国\":{ \"北京\":{\"北京1\":1,\"北京2\":2,\"北京3\":3},  \"上海\":{\"上海1\":4,\"上海2\":5,\"上海3\":6},\"广州\":{\"广州1\":7,\"广州2\":8,\"广州3\":9}}}";
var json2="[{\"test\":\"1\"},{\"test2\":\"2\"}]";

var data1 = json1.dataUsingEncoding(NSUTF8StringEncoding);
var data2 = json2.dataUsingEncoding(NSUTF8StringEncoding);

var obj1:NSDictionary = NSJSONSerialization.JSONObjectWithData(data1!, options: NSJSONReadingOptions.allZeros, error: nil) as NSDictionary
var obj2:NSArray = NSJSONSerialization.JSONObjectWithData(data2!, options: NSJSONReadingOptions.allZeros, error: nil)
    as NSArray

//
for (key,value) in obj1{
    println("\(key)\(value)");
}
for item in obj2{
    println("\(item)");
}

obj2.firstObject?.objectForKey("test")

````

## NSArray NSDictionary 转 NSString

````objc
var re_jsonData1 = NSJSONSerialization.dataWithJSONObject(obj1, options: NSJSONWritingOptions.allZeros, error: nil);

var re_json1 = NSString(data: re_jsonData1!, encoding: NSUTF8StringEncoding);

var re_jsonData2 = NSJSONSerialization.dataWithJSONObject(obj2, options: NSJSONWritingOptions.allZeros, error: nil);

var re_json2 = NSString(data: re_jsonData2! , encoding: NSUTF8StringEncoding)

````