## 获取服务端cookie

````objc
 	//获取cookie
    NSDictionary *headers = [((NSHTTPURLResponse *)resp) allHeaderFields];
    NSLog(@"headers:%@",headers);
    NSDictionary *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:headers forURL:[NSURL URLWithString:@"http://localhost/"]];

    for (NSHTTPCookie *cookie in cookies) {
        NSLog(@"cookie:%@",cookie);
        if ([[cookie name] isEqualToString:@"JSESSIONID"]) {
            NSLog(@"session id is %@",[cookie value]);
        }
    }
````
## 获取客户端cookie

````objc
    //获取本地cookie
    NSHTTPCookieStorage *httpCookiesStorage =  [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSDictionary *cookies = [httpCookiesStorage cookiesForURL:[NSURL URLWithString:@"http://localhost/"]];
    for (NSHTTPCookie *cookie in cookies) {
        NSLog(@"cookie:%@",cookie);
    }

````

## 客户端设置cookie

````objc
//客户端设置cookie
-(void)clientSetCookie{
    
    NSDictionary *prop1 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"a",NSHTTPCookieName,
                           @"aaa",NSHTTPCookieValue,
                           @"/",NSHTTPCookiePath,
                           [NSURL URLWithString:@"http://localhost/"],NSHTTPCookieOriginURL,
                           [NSDate dateWithTimeIntervalSinceNow:60],NSHTTPCookieExpires,
                           nil];
    NSDictionary *prop2 = [NSDictionary dictionaryWithObjectsAndKeys:
                           @"b",NSHTTPCookieName,
                           @"bbb",NSHTTPCookieValue,
                           @"/",NSHTTPCookiePath,
                           [NSURL URLWithString:@"http://localhost/"],NSHTTPCookieOriginURL,
                           [NSDate dateWithTimeIntervalSinceNow:60],NSHTTPCookieExpires,
                           nil];
    
    NSHTTPCookie *cookie1 = [NSHTTPCookie cookieWithProperties:prop1];
    NSHTTPCookie *cookie2 = [NSHTTPCookie cookieWithProperties:prop2];

    //单个设置
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie1];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie2];
    
    //批量设置
//    NSArray *cookies = @[cookie1,cookie2,cookie3];
//    [[NSHTTPCookieStorage sharedHTTPCookieStorage]setCookies:cookies forURL:[NSURL URLWithString:@"http://localhost/"] mainDocumentURL:nil];
    
    //设置cookie本地缓存策略
    //NSHTTPCookieAcceptPolicyAlways:保存所有cookie，这个是默认值
    //NSHTTPCookieAcceptPolicyNever:不保存任何响应头中的cookie
    //NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain:只保存域请求匹配的cookie

    [[NSHTTPCookieStorage sharedHTTPCookieStorage]setCookieAcceptPolicy:NSHTTPCookieAcceptPolicyAlways];

    NSLog(@"设置完成");
}


````

## 删除cookie

````objc

#pragma mark -客户端删除cookie
//根据url和name删除cookie
-(void)deleteCookie:(NSString *)cookieName url:(NSURL *)url{
    //根据url找到所属的cookie集合
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage]cookiesForURL:url];
    for (NSHTTPCookie *cookie in cookies) {
        if([cookie.name isEqualToString:cookieName]){
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            NSLog(@"删除cookie:%@",cookieName);
        }
    }
}
//删除全部cookies
-(void)deleteCookies{
    for (NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage]cookies]) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
    NSLog(@"删除完成");
}
````

## cookie策略


````objc
//设置cookie本地缓存策略
//NSHTTPCookieAcceptPolicyAlways:保存所有cookie，这个是默认值
//NSHTTPCookieAcceptPolicyNever:不保存任何响应头中的cookie
//NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain:只保存域请求匹配的cookie
````