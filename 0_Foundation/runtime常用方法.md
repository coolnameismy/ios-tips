## 类

## 类结构

````objc
struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;
#if !__OBJC2__
    Class super_class                       OBJC2_UNAVAILABLE;  // 父类
    const char *name                        OBJC2_UNAVAILABLE;  // 类名
    long version                            OBJC2_UNAVAILABLE;  // 类的版本信息，默认为0
    long info                               OBJC2_UNAVAILABLE;  // 类信息，供运行期使用的一些位标识
    long instance_size                      OBJC2_UNAVAILABLE;  // 该类的实例变量大小
    struct objc_ivar_list *ivars            OBJC2_UNAVAILABLE;  // 该类的成员变量链表
    struct objc_method_list **methodLists   OBJC2_UNAVAILABLE;  // 方法定义的链表
    struct objc_cache *cache                OBJC2_UNAVAILABLE;  // 方法缓存
    struct objc_protocol_list *protocols    OBJC2_UNAVAILABLE;  // 协议链表
#endif
} OBJC2_UNAVAILABLE;
struct objc_object {
    Class isa  OBJC_ISA_AVAILABILITY;
};
````

### 类实例结构

````objc
typedef struct objc_object *id;

````
###  常用函数

````objc
// 获取类的类名
const char * class_getName ( Class cls );
// 获取类的父类
Class class_getSuperclass ( Class cls );
// 判断给定的Class是否是一个元类
BOOL class_isMetaClass ( Class cls );
// 获取实例大小
size_t class_getInstanceSize ( Class cls );
// 获取类中指定名称实例成员变量的信息
Ivar class_getInstanceVariable ( Class cls, const char *name );
// 获取类成员变量的信息
Ivar class_getClassVariable ( Class cls, const char *name );
// 添加成员变量,方法只能在objc_allocateClassPair函数与objc_registerClassPair之间调用
BOOL class_addIvar ( Class cls, const char *name, size_t size, uint8_t alignment, const char *types );
// 获取整个成员变量列表 ，后续必须使用free释放Ivar这个数组对象
Ivar * class_copyIvarList ( Class cls, unsigned int *outCount );
// 获取指定的属性
objc_property_t class_getProperty ( Class cls, const char *name );
// 获取属性列表
objc_property_t * class_copyPropertyList ( Class cls, unsigned int *outCount );
// 为类添加属性
BOOL class_addProperty ( Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount );
// 替换类的属性
void class_replaceProperty ( Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount );

````



##  方法

### 结构 

````objc
typedef struct objc_method *Method;
struct objc_method {
    SEL method_name                 OBJC2_UNAVAILABLE;  // 方法名
    char *method_types              OBJC2_UNAVAILABLE;
    IMP method_imp                  OBJC2_UNAVAILABLE;  // 方法实现
}  
````

### 类方法的常用函数

````objc
// 添加方法
BOOL class_addMethod ( Class cls, SEL name, IMP imp, const char *types );
// 获取实例方法
Method class_getInstanceMethod ( Class cls, SEL name );
// 获取类方法
Method class_getClassMethod ( Class cls, SEL name );
// 获取所有方法的数组
Method * class_copyMethodList ( Class cls, unsigned int *outCount );
// 替代方法的实现
IMP class_replaceMethod ( Class cls, SEL name, IMP imp, const char *types );
// 返回方法的具体实现
IMP class_getMethodImplementation ( Class cls, SEL name );
IMP class_getMethodImplementation_stret ( Class cls, SEL name );
// 类实例是否响应指定的selector
BOOL class_respondsToSelector ( Class cls, SEL sel );

````

### 方法的常用函数

````objc
// 调用指定方法的实现
id method_invoke ( id receiver, Method m, ... );
// 调用返回一个数据结构的方法的实现
void method_invoke_stret ( id receiver, Method m, ... );
// 获取方法名
SEL method_getName ( Method m );
// 返回方法的实现
IMP method_getImplementation ( Method m );
// 获取描述方法参数和返回值类型的字符串
const char * method_getTypeEncoding ( Method m );
// 获取方法的返回值类型的字符串
char * method_copyReturnType ( Method m );
// 获取方法的指定位置参数的类型字符串
char * method_copyArgumentType ( Method m, unsigned int index );
// 通过引用返回方法的返回值类型字符串
void method_getReturnType ( Method m, char *dst, size_t dst_len );
// 返回方法的参数的个数
unsigned int method_getNumberOfArguments ( Method m );
// 通过引用返回方法指定位置参数的类型字符串
void method_getArgumentType ( Method m, unsigned int index, char *dst, size_t dst_len );
// 返回指定方法的方法描述结构体
struct objc_method_description * method_getDescription ( Method m );
// 设置方法的实现
IMP method_setImplementation ( Method m, IMP imp );
// 交换两个方法的实现
void method_exchangeImplementations ( Method m1, Method m2 )

//函数调用
objc_msgSend(receiver, selector)
objc_msgSend(receiver, selector, arg1, arg2, ...)
````
### 方法选择器

````objc
// 返回给定选择器指定的方法的名称
const char * sel_getName ( SEL sel );
// 在Objective-C Runtime系统中注册一个方法，将方法名映射到一个选择器，并返回这个选择器
SEL sel_registerName ( const char *str );
// 在Objective-C Runtime系统中注册一个方法
SEL sel_getUid ( const char *str );
// 比较两个选择器
BOOL sel_isEqual ( SEL lhs, SEL rhs );
````

##  动态创建类

````objc
// 创建一个新类和元类 extraBytes通常指定为0，该参数是分配给类和元类对象尾部的索引ivars的字节数。
Class objc_allocateClassPair ( Class superclass, const char *name, size_t extraBytes );
// 销毁一个类及其相关联的类
void objc_disposeClassPair ( Class cls );
// 在应用中注册由objc_allocateClassPair创建的类
void objc_registerClassPair ( Class cls );
````

示例：

````objc 
Class cls = objc_allocateClassPair(MyClass.class, "MySubClass", 0);

class_addMethod(cls, @selector(submethod1), (IMP)imp_submethod1, "v@:");
class_replaceMethod(cls, @selector(method1), (IMP)imp_submethod1, "v@:");
class_addIvar(cls, "_ivar1", sizeof(NSString *), log(sizeof(NSString *)), "i");

objc_property_attribute_t type = {"T", "@\"NSString\""};
objc_property_attribute_t ownership = { "C", "" };
objc_property_attribute_t backingivar = { "V", "_ivar1"};
objc_property_attribute_t attrs[] = {type, ownership, backingivar};

class_addProperty(cls, "property2", attrs, 3);
objc_registerClassPair(cls);

id instance = [[cls alloc] init];
[instance performSelector:@selector(submethod1)];
[instance performSelector:@selector(method1)];
````

##  动态创建对象

````objc
// 创建类实例
id class_createInstance ( Class cls, size_t extraBytes );
// 在指定位置创建类实例
id objc_constructInstance ( Class cls, void *bytes );
// 销毁类实例
void * objc_destructInstance ( id obj );
````

例子：

````objc
id theObject = class_createInstance(NSString.class, sizeof(unsigned));
id str1 = [theObject init];
NSLog(@"%@", [str1 class]);
id str2 = [[NSString alloc] initWithString:@"test"];
NSLog(@"%@", [str2 class]);
````

##   成员变量、属性

### Ivar 结构
>	Ivar是表示实例变量的类型，其实际是一个指向objc_ivar结构体的指针，其定义如下：

````objc
typedef struct objc_ivar *Ivar;
struct objc_ivar {
    char *ivar_name                 OBJC2_UNAVAILABLE;  // 变量名
    char *ivar_type                 OBJC2_UNAVAILABLE;  // 变量类型
    int ivar_offset                 OBJC2_UNAVAILABLE;  // 基地址偏移字节
#ifdef __LP64__
    int space                       OBJC2_UNAVAILABLE;
#endif
} 
````
### objc_property_t 属性结构 

````objc
typedef struct objc_property *objc_property_t;

typedef struct {
    const char *name;           // 特性名
    const char *value;          // 特性值
} objc_property_attribute_t;

````

##   常用方法

````objc
// 获取成员变量名
const char * ivar_getName ( Ivar v );
// 获取成员变量类型编码
const char * ivar_getTypeEncoding ( Ivar v );
// 获取成员变量的偏移量
ptrdiff_t ivar_getOffset ( Ivar v );
// 设置关联对象
void objc_setAssociatedObject ( id object, const void *key, id value, objc_AssociationPolicy policy );
// 获取关联对象
id objc_getAssociatedObject ( id object, const void *key );
// 移除关联对象
void objc_removeAssociatedObjects ( id object );
// 获取属性名
const char * property_getName ( objc_property_t property );
// 获取属性特性描述字符串
const char * property_getAttributes ( objc_property_t property );
// 获取属性中指定的特性
char * property_copyAttributeValue ( objc_property_t property, const char *attributeName );
// 获取属性的特性列表
objc_property_attribute_t * property_copyAttributeList ( objc_property_t property, unsigned int *outCount );



````

