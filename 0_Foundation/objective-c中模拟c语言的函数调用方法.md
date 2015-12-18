## objective-c中模拟c语言的函数调用方法
>  在很多第三方objc库中，你会看到一些很优雅的函数调用方法，例如masonry中，定义约束的函数

````objc

[row1 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.right.and.left.equalTo(view);
    make.height.equalTo(view.mas_height).multipliedBy(0.25);
    make.top.equalTo(view.mas_top);
}];

````

** 注意点： **（1）and属性：

````objc
对应的源码
- (MASConstraint *)and {
    return self;
}
````objc

and方法什么都没做，只是返回了自己，一个好的方法名，是可以让你写的方法可以读出来，and的存在的意义就是让方法读出来更通顺。我们读下面的两个方法试试看

````objc
make.right.and.left.equalTo(view);//很通顺，可以读出来并且很容易理解其中的意思
make.right.left.equalTo(view);//不通顺，right是什么，怎么还有left对象？

````

类似的，我们还可以定义一些with，then，together等等，加入这些连词，让方法更优雅。


** 注意点： **（2）方法 ````objc equalTo(view.mas_height).multipliedBy(0.25) ````

这种括号式的方法调用体并不是objc的消息式的方法调用，这个符合c语言的方法调用，我们看看背后的实现：

````objc

.h中
- (MASConstraint * (^)(id attr))equalTo;
- (MASConstraint * (^)(CGFloat multiplier))multipliedBy;

.m中
- (MASConstraint * (^)(id))equalTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationEqual);
    };
}

- (MASConstraint * (^)(CGFloat multiplier))multipliedBy { MASMethodNotImplemented(); }

````

what？这个是什么奇怪的东西？ 其实这个就是一个一个objc的方法，返回值是一个block,再实现中，返回一个block执行的结果，我们按照他的模式定义一个add方法试一试

````objc

.h
-(int (^)(int a,int b)) add;

.m
-(int (^)(int, int))add{
    return ^int(int a,int b){
        return a+b;
    };
}

````

方法的调用：

````objc
NSLog(@"%d",testClass.add(1,2));
````

## 其他疑问

有的人或许觉得直接定义c语言的函数，就能做上面的事情，其实不是的，大家可以写一个试试看。它主要存在2个缺点

````objc
int add1(int a,int b){
    return  a+b;
}

````

-   1:c语言定义的函数只属于所在的文件中且不依赖于对象,这样定义的函数可以写成add(1,2); 但是不可能写成testClass.add(1,2);

-   2:函数内部不能直接通过成员变量名访问某个对象的成员变量






