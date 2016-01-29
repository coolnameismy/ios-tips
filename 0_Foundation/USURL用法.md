
## 0.经典用法
````objc
NSURL *url1 = [NSURL URLWithString:@"http://www.baidu.com/img/bd_logo1.png"];
NSURL *url2 = [NSURL URLWithString:@"/img/bd_logo1.png" relativeToURL:[NSURL URLWithString:@"http://www.baidu.com"]];
````
## 1.加载项目中本地网页
````objc
NSString *urlPath = [[NSBundle mainBundle] pathForResource:@"404" ofType:@"html"];
NSURL *url = [NSURL URLWithString:urlPath];
````
## 2.获取扩展名
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me/hello.png"];
NSString *pathExtension = [url pathExtension];//扩展名 png
````
## 3.获取组成部分
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me/index.htm"];
NSArray *pathComponentsArray = [url pathComponents];//所有组成部分  [/,index.htm]
````
## 4.获取主机
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me/index.htm"];
NSString *host = [url host];//主机 www.iyiming.me
````
## 5.获取端口号
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me:80/index.htm"];
NSNumber *port = [url port];//端口号 80
````
## 6.获取查询参数
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me:80/index.htm?key1=value1&key2=value2"];
NSString *query = [url query];//查询参数 key1=value1&key2=value2
````
## 7.获取协议名称
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me:80/index.htm?key1=value1&key2=value2"];
NSString *scheme = [url scheme];//协议 http
````
## 8.获取锚定位
````objc
NSURL *url = [NSURL URLWithString:@"http://www.iyiming.me:80/index.htm#jumpLocation"];
NSString *fragment = [url fragment];//锚定位 jumpLocation
````
## 9.获取用户名
````objc
NSURL *url = [NSURL URLWithString:@"ftp://yiming@www.iyiming.me"];
NSString *user = [url user];//用户名 yiming
````
