````objc
//创建一个NSString
NSString *myString1 = @"some string";

//格式化创建
NSString *myString2 = [NSString stringWithFormat:@"%@",myString1];

//返回数字的值
NSString *myString3 = @"123";
double doubleString = [myString3 floatValue];
int intString = [myString3 intValue];

//比较两个字符串,若相同返回TURE
BOOL areEqual = [myString1 isEqualToString:myString2];

//区分大小写的比较
BOOL areEqual1 = ([myString1 caseInsensitiveCompare:myString2] == NSOrderedSame);


//转换大小写
NSString *myString4 = @"asdfg";
NSString *upper = [myString4 uppercaseString];
NSString *lower = [upper lowercaseString];

//截去字符串(以空格为例)
//whitespaceAndNewlineCharacterSet去除前后的空格和换行符
//whitespaceCharacterSet 去除前后的空格,实际效果来看只实现了去除首字母前面的空格
NSString *myString5 = @"   one     two three  ";
NSString *trimmed1 = [myString5 stringByTrimmingCharactersInSet:[NSCharacterSetwhitespaceAndNewlineCharacterSet]];
NSString *trimmed2 = [myString5 stringByTrimmingCharactersInSet:[NSCharacterSetwhitespaceCharacterSet]];



//predicate 断言断定，使基于,下面的方法实现删除空格
NSPredicate *noE = [NSPredicatepredicateWithFormat:@"SELF!=''"];
NSArray *part = [myString5 componentsSeparatedByCharactersInSet:[NSCharacterSetwhitespaceCharacterSet]];
NSArray *file = [part filteredArrayUsingPredicate:noE];
NSString *trimmed3 = [file componentsJoinedByString:@""];
NSLog(@"trimmed3 = %@",trimmed3);

//有已知字符串创建子字符串
NSString * number = @"abx cdefghi gklmn";
//substringToIndex获取字符串的前三个
//substringFromIndex从第三个开始截取到最后
NSString *myString6 = [number substringToIndex:3];

//用边界截取起始位置为第四个，长度为5个长度
NSRange range = NSMakeRange(4, 5);
NSString *aString = [number substringWithRange:range];


//创建成数组
NSArray *arr = [number componentsSeparatedByString:@" "];

//替换子字符串
NSString *myString7 = [number stringByReplacingOccurrencesOfString:@"efg"withString:@"aaa"];

//查找子字符串,这段代码返回（4,3）;
NSRange found = [number rangeOfString:@"cde"];

//判读那是否包含
BOOL found1 = ([number rangeOfString:@"cde"].location !=NSNotFound);

//组合字符串
NSString *myString9 = [myString1 stringByAppendingString:myString7];
NSString *myString10 = [myString1 stringByAppendingFormat:myString7];

//将文件内容写入到字符串中
NSString *fileContents = [NSString stringWithContentsOfFile:@"123.text"];

//获取文件扩展名
NSString *filename = @"11111.txt";
NSString *fileExtension = [filename pathExtension];

//将URL内容写入字符串
NSURL *url = [NSURLURLWithString:@"http://www.baidu.com"];
NSString *pageContents  = [NSString stringWithContentsOfURL:url];

````