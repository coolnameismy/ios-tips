
> __attribute__ 关键词可以定义一些先于活着后与main含住执行的代码


__attribute__((constructor(PRIORITY)))


````
__attribute__( ( constructor ) ) static void Initializer()
{
    static int isInitialized = 0;
    if( !isInitialized ) {
        isInitialized = 1;
        NSLog(@"Initializer");
    }
}
````


__attribute__((destructor(PRIORITY)))


````
__attribute__( ( constructor ) ) static void DeInitializer()
{
        NSLog(@"DeInitializer");
}
````