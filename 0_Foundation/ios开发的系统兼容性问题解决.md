##  ios开发的系统兼容性问题解决

###  1:系统方法过时的注解

````objc

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0);


说明方法在2.0时代引入，3.0时代过时

````

##  2：系统不同版本方法的兼容性解决方案1 （最佳，不产生警告）

````objc

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0
    if([picker respondsToSelector:@selector(dismissModalViewControllerAnimated:)]){
        [picker dismissModalViewControllerAnimated:YES completion:nil];
    }
    else
#endif
    {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }

````

##  3：系统不同版本方法的兼容性解决方案2：（书写方便，但是会产生警告）

````objc

if([picker respondsToSelector:@selector(imagePickerController:didFinishPickingMediaWithInfo:)]){
    [picker dismissViewControllerAnimated:YES completion:nil];
}else{
    [picker dismissModalViewControllerAnimated:YES];
}

````
