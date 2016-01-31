
````objc

//原始地址
NSString *urlString = @"http://wwW.xxx.com?query= this is question";

//url编码
[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]//ios 9+
[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]//ios9 -

//去除url编码
urlEncodeString = [urlEncodeString stringByRemovingPercentEncoding];

````

