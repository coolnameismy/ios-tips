## AFNetworking 使用


方式1:建议先写一个http请求的客户端，继承AFHTTPSessionManager

````objc

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface AppNetworkingClient : AFHTTPSessionManager
//instancetype
+(instancetype) shareClient;
@end


#import "AppNetworkingClient.h"
static NSString const *baseUrlString = @"http://115.29.226.138:8081/v1/";

@implementation AppNetworkingClient
+ (instancetype)shareClient {
    
    static AppNetworkingClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AppNetworkingClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrlString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        //设置超时时间 10秒
        _sharedClient.requestSerializer.timeoutInterval = 10;
    });
    
    return _sharedClient;
}
@end
````


2:get使用


````objc

        AppNetworkingClient *client = [AppNetworkingClient shareClient];
        [client GET:@"college" parameters:nil success:^(NSURLSessionDataTask *task, id JSON) {
            //如果结果是一个数组，则直接使用for (NSDictionary *attributes in json)
            //如果结果是一个json，则先使用valueforkeypath
            //NSArray *postsFromResponse = [JSON valueForKeyPath:@""];       
            for (NSDictionary *attributes in JSON) {           			
     
            }
        } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
           
        }];
````

3:post使用


方式2:使用AFHTTPRequestOperationManager


````objc

get request
----------------------------------------------------------------------------------------
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
[manager GET:@"http://example.com/resources.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];


POST URL-FORM-ENCODED REQUEST
----------------------------------------------------------------------------------------
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
NSDictionary *parameters = @{@"foo": @"bar"};
[manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];


POST MULTI-PART REQUEST
----------------------------------------------------------------------------------------
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
NSDictionary *parameters = @{@"foo": @"bar"};
NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
[manager POST:@"http://example.com/resources.json" parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    [formData appendPartWithFileURL:filePath name:@"image" error:nil];
} success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"Success: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];

````

方式3:序列化请求

````objc
NSString *URLString = @"http://example.com";
NSDictionary *parameters = @{@"foo": @"bar", @"baz": @[@1, @2, @3]};
QUERY STRING PARAMETER ENCODING
[[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:parameters error:nil];
GET http://example.com?foo=bar&baz[]=1&baz[]=2&baz[]=3
URL FORM PARAMETER ENCODING
[[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters];
POST http://example.com/
Content-Type: application/x-www-form-urlencoded

foo=bar&baz[]=1&baz[]=2&baz[]=3
JSON PARAMETER ENCODING
[[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters];
POST http://example.com/
Content-Type: application/json
{"foo": "bar", "baz": [1,2,3]}


AFJSONRequestOperation 使用
AFJSONRequestOperation *operation1 = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, NSDictionary* JSON) {  
               NSLog(@"获取到的数据为：%@",JSON);  
   } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id data) {  
       NSLog(@"发生错误！%@",error);  
   }];  
   [operation1 start]; 

````
   
4：文件上传


````swift

//上传单张图片
+(void)uploadImage:(UIImage *)image
              name:(NSString *)filename
           succeed:(void(^)(FileResp *file))succeed
            failed:(void(^)(NSString *msg))failed{
    
    NSString *fileUploadUrl = [NSString stringWithFormat:@"%@/files/upload",baseUrl];
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:fileUploadUrl parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"file" fileName:filename mimeType:@"image/jpeg"];
    } error:nil];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSProgress *progress = nil;
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        //网络传输错误
        if (error) {
            NSLog(@"Error: %@", error);
            failed(@"网络传输错误");
        }
        //传输成功
        else {
            //成功
            if([AppNetworkingClient responceStatus:responseObject]){
                FileResp *fileRes           = [FileResp initWithDictionary:[responseObject objectForKey:@"data"]];
                succeed(fileRes);
            }
            //服务端返回错误信息
            else{
                failed([AppNetworkingClient responceMsg:responseObject]);
            }
 
        }
    }];
    
    [uploadTask resume];
    
}


````

## 对服务器返回数据的解析


````
1.AFN可以自动对服务器返回的数据进行解析
* 默认将服务器返回的数据当做JSON来解析

2.设置对服务器返回数据的解析方式
1> 当做是JSON来解析（默认做法）
* mgr.responseSerializer = [AFJSONResponseSerializer serializer];
* responseObject的类型是NSDictionary或者NSArray

2> 当做是XML来解析
* mgr.responseSerializer = [AFXMLParserResponseSerializer serializer];
* responseObject的类型是NSXMLParser

3> 直接返回data
* 意思是：告诉AFN不要去解析服务器返回的数据，保持原来的data即可
* mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
=========基础知识=========
````



## tips

1：设置AppNetworkingClient超时时间的方法：

_sharedClient.requestSerializer.timeoutInterval = 10;


2:github地址

https://github.com/AFNetworking/AFNetworking

3:详细文档地址

http://cocoadocs.org/docsets/AFNetworking/2.5.4/

4:pod引用地址

````
platform :ios, '7.0'
pod "AFNetworking", "~> 2.0"
````


5:https请求需要添加一个secrityPolicy

````objc
AFSecurityPolicy *securityPolicy = [AFSecurityPolicy defaultPolicy];  
securityPolicy.allowInvalidCertificates = YES;  
[AFHTTPRequestOperationManager manager].securityPolicy = securityPolicy;

````

