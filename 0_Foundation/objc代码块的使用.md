>	objc中可以合理使用代码块的特性，使局部变量更清晰


一个 GCC 非常模糊的特性，以及 Clang 也有的特性是，代码块如果在闭合的圆括号内的话，会返回最后语句的值

````objc
NSURL *url = ({
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", baseURLString, endpoint];
    [NSURL URLWithString:urlString];
});

````