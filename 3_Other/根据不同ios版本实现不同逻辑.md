##  objc

````objc
#if  __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_8_0
     // iOS 8或更高版本
#else
     // iOS8之前的版本
#endif
````


##  swift


````swift

if #available(iOS 8, *) {
    // iOS 8或更高版本
     
} else {
    // iOS8之前的版本
     
}

````