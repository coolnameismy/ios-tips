## Swizzling
> Swizzling用一个词解释就是偷天换日。通过重新映射方法代替原有的方法


举例：使用xxx_viewWillAppear方法替代原先的viewWillAppear方法

````objc
+ (void)load {
        static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];         
        // When swizzling a class method, use the following:
                    // Class class = object_getClass((id)self);

        SEL originalSelector = @selector(viewWillAppear:);
                    SEL swizzledSelector = @selector(xxx_viewWillAppear:);

        Method originalMethod = class_getInstanceMethod(class, originalSelector);
                    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        BOOL didAddMethod =
                        class_addMethod(class,
                originalSelector,
                method_getImplementation(swizzledMethod),
                method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
                        class_replaceMethod(class,
                swizzledSelector,
                method_getImplementation(originalMethod),
                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark - Method Swizzling

- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@", self);
}
````

## 注意

-   Swizzling应该总是在+load中执行
-   Swizzling应该总是在dispatch_once中执行
-   
