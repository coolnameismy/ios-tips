## ios中bundle的使用

将图片文件夹的后缀改名为：xxx.bundle
 
## VC获得bundle中的资源

NSString * bundlePath = [[ NSBundle mainBundle] pathForResource: @ "MyBundle" ofType :@ "bundle"];
NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
UIViewController *vc = [[UIViewController alloc] initWithNibName:@"vc_name" bundle:resourceBundle];

## UIImageView获得bundle中的资源

UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
UIImage *image = [UIImage imageNamed:@"MyBundle.bundle/img_collect_success"];
[imgView setImage:image];

