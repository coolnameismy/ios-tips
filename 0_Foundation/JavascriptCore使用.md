````objc

//直接执行js代码
- (void)evaluateScript {
    //定义一个js并执行函数
    JSValue *exeFunction1 = [self.jsContext evaluateScript:@"function hi(){ return 'hi' }; hi()"];
    //执行一个闭包js
    JSValue *exeFunction2 = [self.jsContext evaluateScript:@"(function(){ return 'hi' })()"];
    
    //更多的应用场景使用网络或者本地文件加载一段js代码，充分利用其灵活性
    NSString * path = [[NSBundle mainBundle] pathForResource:@"core" ofType:@"js"];
    NSString * html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    JSValue *constructor = [self.jsContext evaluateScript:html];

}


//Native注册方法给js调用
- (void)regiestJSFunction {
    //注册一个函数
    [self.jsContext evaluateScript:@"var hello = function(){ return 'hello' }"];
    //调用
    JSValue *value1 = [self.jsContext evaluateScript:@"hello()"];
    
    //注册一个匿名函数
    JSValue *jsFunction = [self.jsContext evaluateScript:@" (function(){ return 'hello objc' })"];
    //调用
    JSValue *value2 = [jsFunction callWithArguments:nil];
}

//注册js方法给Native调用
- (void)regiestNativeFunction {
    //注册一个objc方法给js调用
    self.jsContext[@"log"] = ^(NSString *msg){
        NSLog(@"js:msg:%@",msg);
    };
    //另一种方式，利用currentArguments获取参数
    self.jsContext[@"log"] = ^() {
        NSArray *args = [JSContext currentArguments];
        for (id obj in args) { NSLog(@"%@",obj); }
    };
    //使用js调用objc
    [self.jsContext evaluateScript:@"native_log('hello,i am js side')"];
}

//注册js错误处理
- (void)jsExceptionHandler {
    self.jsContext.exceptionHandler = ^(JSContext *con, JSValue *exception) {
        NSLog(@"%@", exception);
        con.exception = exception;
    };
}

//JSExprot协议使用
- (void)useJSExprot {
    Person *p = [[Person alloc]init];
    self.jsContext[@"person"] = p;
    
    JSValue *value = [self.jsContext evaluateScript:@"person.whatYouName()"];
    
}

````

Person.h

````objc

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol JSPersonProtocol <JSExport>

@property (nonatomic, copy) NSDictionary *data;
- (NSString *)whatYouName;

@end


@interface Person : NSObject<JSPersonProtocol>

@property (nonatomic, copy)NSString *name;
- (NSString *)whatYouName;

@end


````

Person.m

````objc
#import "Person.h"

@implementation Person

-(NSString *)whatYouName {
    return @"hi";
}


@end


````

//http://blog.iderzheng.com/ios7-objects-management-in-javascriptcore-framework/
//http://www.webryan.net/2013/10/about-ios7-javascriptcore-framework/

