# SDWebImage使用


## SDWebImage引用

SDWebImage 3.6 手动引用

````
1:下载SDWebImage.framework
2:右键项目－add fileto  ，选择SDWebImage.framework
3:添加依赖库 1:ImageIO 2:MapKit
4:build setting => other linker flags: 添加参数-ObjC
````

注意！！！！！！！！！！！！！！！！！！！！！！！！！！！！

-  1：添加成功后项目中sdwebimage是以包出现的，并且bulid phases 中link binary中会增加sdwebimage
-  2: 若不形行，先清理项目，删除生成的项目文件，再从新编译添加


使用cocoapod添加

````objc


==========================SDWebImage使用==============================================
SDWebImage使用
SDWebImage这个类库提供一个UIImageView类别以支持加载来自网络的远程图片。具有缓存管理、异步下载、同一个URL下载次数控制和优化等特征。

将SDWebImage类库添加入工程时，一定注意需要添加MapKit.framework，如图所示，因为MKAnnotationView+WebCache.h依赖该framework。

1.     UITableView使用UIImageView+WebCache类（基本应用，UIImageView的一个category）

前提#import导入<SDWebImage/UIImageView+WebCache.h>文件，然后在tableview的cellForRowAtIndexPath：方法下：

 
 1
 2 #import <SDWebImage/UIImageView+WebCache.h>
 3 
 4 
 5 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 6 {
 7     static NSString *MyIdentifier = @"MyIdentifier"; 
 8 
 9     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
10 
11     if (cell == nil)
12     {
13         cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
14                                        reuseIdentifier:MyIdentifier] autorelease];
15     }
16 
17     // Here we use the new provided setImageWithURL: method to load the web image
18     [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"]
19                    placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
20 
21     cell.textLabel.text = @"My Text";
22     return cell;
23 }
复制代码
1 [imageView setImageWithURL:[NSURL URLWithString:@<a href="http://www.domain.com/path/image.jpg">http://www.domain.com/path/image.jpg</a>]];
针对iOS4+目标平台，还可以使用如下块语句：

1 // Here we use the new provided setImageWithURL: method to load the web image
2 [cell.imageView setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"]
3                placeholderImage:[UIImage imageNamed:@"placeholder.png"]
4                         success:^(UIImage *image) {... success code here ...}
5                         failure:^(NSError *error) {... failure code here ...}];
2.     使用SDWebImageManager类：可以进行一些异步加载的工作。

复制代码
 1 SDWebImageManager *manager = [SDWebImageManager sharedManager];
 2 UIImage *cachedImage = [manager imageWithURL:url]; // 将需要缓存的图片加载进来
 3 if (cachedImage) {
 4       // 如果Cache命中，则直接利用缓存的图片进行有关操作
 5       // Use the cached image immediatly
 6 } else {
 7       // 如果Cache没有命中，则去下载指定网络位置的图片，并且给出一个委托方法
 8       // Start an async download
 9      [manager downloadWithURL:url delegate:self];
10 }
复制代码
当然你的类要实现SDWebImageManagerDelegate协议，并且要实现协议的webImageManager:didFinishWithImage:方法。

1 // 当下载完成后，调用回调方法，使下载的图片显示
2 - (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image {
3     // Do something with the downloaded image
4 }
3.     独立的异步图像下载
可能会单独用到异步图片下载，则一定要用downloaderWithURL:delegate:来建立一个SDWebImageDownloader实例。

1 downloader =[SDWebImageDownloader downloaderWithURL:url delegate:self];
这样SDWebImageDownloaderDelegate协议的方法imageDownloader:didFinishWithImage:被调用时下载会立即开始并完成。

4.     独立的异步图像缓存

SDImageCache类提供一个创建空缓存的实例，并用方法imageForKey:来寻找当前缓存。

1 UIImage*myCachedImage = [[SDImageCache sharedImageCache] imageFromKey:myCacheKey];
存储一个图像到缓存是使用方法storeImage: forKey:

1 [[SDImageCachesharedImageCache] storeImage:myImage forKey:myCacheKey];
默认情况下，图像将被存储在内存缓存和磁盘缓存中。如果仅仅是想内存缓存中，要使用storeImage:forKey:toDisk:方法的第三个参数带一负值
来替代。

========================================================
引用地址
http://www.cnblogs.com/wangshengl9263/p/3347933.html

````

