##  objc 验证参数有效性的方法

使用NSParameterAssert 可以做参数有限性验证，如果错误则抛出异常，例如：

````objc
NSParameterAssert([dictionary isKindOfClass:NSDictionary.class]);
````

