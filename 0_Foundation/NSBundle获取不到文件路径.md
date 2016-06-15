#  NSBundle获取不到文件路径

获取项目资源的方法：例如获取工程中的 1.txt
 [[NSBundle mainBundle] pathForResource:@"1" ofType:@"txt"];
 [[NSBundle mainBundle] pathForResource:@"1.txt" ofType:nil];


 但是获取一个不常见的文件扩展名,例如enc,通过这个方式有时候获取不到，原因是你拖拽文件进入工程时，不常见的扩展名文件不会自动加入到Copy Bundle Resource中，需要手动添加一次，之后在使用方法就可以获取到了。 
