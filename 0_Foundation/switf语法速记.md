#(一)类型

##常见类型

````swift
Int,String,Double,struct,enum,class,tuple

//typle 元组类型
//声明
let someTuple:(Int,Int) = (10,23)
//元组可以设置名称
var person = (name:"liuyw",age:30)
//取值方式1
person.0
person.1
//取值方式2
person.age
person.name
//取值方式3
var (personName,personAge) = person
personName
personAge

someTuple.0或者tuple.1

//typealias
//类型的别名关键字

//函数类型
func

//可选类型
var num:Int? = nil
var num1:Optional<Int> = nil

//隐式解析可选
var num:Int!
var num1:ImplicitlyUnwrappedOptional<Int>

//协议合成类型
var someProtocol:protocol<protocol1,protocol2>

````

## Array

````swift
//声明
var array1:[String] = ["0","1","2","3"]
var array = [String]()

//修改值
array1 += ["4","5"]
array1[1...3] = ["a","b","c","d","e"]
//array1.append
//array1.removeAtIndex(<index:Int Int>)
//array1.insert(<newElement:Element>, atIndex:<Int>)

//获取值
print(array1)
print(array1[0])
print(array1.last)
print(array1.first)

var str:String = ""

//遍历
for item:String in array1{
    
}


for bgen in array1.enumerate()
{
    print("元素下标:\(bgen.0)  元素值:\(bgen.1)")
}
````

## dictionary 

````swift
 
//声明
var dic:Dictionary<String,String> = ["name":"liu","age":"30"]
var dic1 = Dictionary<String,String>()

//修改值
dic["name"] = "liuyanwei"
dic["name1"] = "liuyanwei1"
dic.updateValue("liuyw", forKey: "name")//返回原值
dic1.indexForKey("name1")
dic.removeValueForKey("name")

//获取值
dic["name"]

//字典的循环
for (key,value) in dictionary{
    println("key is: \(key) value is : \(value)");
}


````

##枚举enum
````swift

//整形的枚举
enum Sharp:Int{
    case Rect=1,Circle,Star
    //switch中的选项可以用.表示
    func desc()->String{
        switch self{
        case .Rect:
            return "this is rect"
        case .Circle:
            return "this is circle"
        case .Star:
            return "this is star"
        }
    }
}
//enum的值
Sharp.RawValue(1)
//调用枚举的方法
Sharp.Rect.desc()

````
##结构struct

````swift
//结构
//结构和类的最重要的区别就是架构是传值，类是传引用
struct Sharp{
    //属性
    var width:Int
    var height:Int
    //方法
    func area()->Int{
        return self.width*self.height;
    }
    //允许修改属性的方法前缀 mutating
    mutating func zoomIn() {
        self.width += 100
        self.height += 100
    }
}
````
##协议

````swift

//可以被class，struct，enum实现
protocol Sharp{
    //属性
    var width:String{get}
    var heiht:String{get set}
    //方法
    func area()->Int
    
}

//swift 可选和必选协议
//只能被class实现，无法给struct和enum实现
@objc protocol OptionalProtocol {
    //可选协议
    optional func optionalMethod()
    //必选协议
    func necessaryMethod()
}

````

##对象

````swift
class Card: NSObject {
    
}
class Person: NSObject {

    //私有对象
    private var _name:String?
    
    var gender:String
    var gender1:String?
    
    //arc
    /*
    weak 用于可空对象，unowned用于非空对象
    weak 调用被释放的对象会返回nil，unowned 调用被释放的对象会出异常
    建议 如果能够确定在访问时不会已被释放的话，尽量使用 unowned，如果存在被释放的可能，那就选择用 weak
    */
    weak var bastFriend:Person?
    unowned var identityCard:Card
    

    //构造函数
    init(name: String) {
        gender = "male"
        identityCard = Card()
        super.init()
        //初始化。。。
        self.name = name
    }
    //便利构造函数
    convenience init(name:String,gender:String)
    {
        self.init(name:name)
        self.gender = gender
    }
    
    //析构函数
    deinit{
        
    }
    
    //属性
    var name:String{
        get{
            return _name!
        }
        set{
            _name = newValue;
        }
        //可以自定newValue的名称
        //set(newName){
        //   _gender = newName
        //}
    }
    
    //观察者模式的属性
    //newValue 和 oldValue 
    var age:Int = 0{
        willSet{}
        didSet{}
    }
    
    //方法
    func sayName(){
        print("hello name")
    }
    
    //静态方法
    static func say(){
        print("hello")
    }
    
    //类方法
    class func say1(){
        print("hello1")
    }
    
    //方法重载
    override func copy() -> AnyObject {
        return ""
    }
    
    //懒属性
    //两种方式，方法加载和闭包加载
    lazy var friends:[String] = self.findfriends()
    func findfriends()->[String]{
        return ["bob","bill","jobs"]
    }
    lazy var bastFirends:String = {
        print(" print bastFirends")
        return "liuyanwei"
        }()
    //调用
    //NSLog("bastFirends:%@ and friends is:[%@] ",p.bastFirends,p.friends)
    
    //下标脚本
    subscript(name:String)->String{
        get{
            return self.name
        }
        set{
            self.name = newValue;
        }
    }
    

}
````


#（二）语法

##流程控制

###if语句

````swift

//判断是Option类是否有值
if let theStr = str2 {
    print("ture")
}

````

###switch

````swift
//switch 数字区间
var condition1 = 888_888_888;
switch condition1{
    case -999_999...38: print("case1");
    case 40...88: print("case2");
    case 100...188: print("case3");
    case 200...999_999_999_999: print("case3");
    default:break;
}

//switch  元组
var condition2 = (100,88);
switch condition2{
    case (-99999...0,-99999...0),(40...88,0..<100): print("case1")//匹配多个条件
case let (_,y): print(y); fallthrough // 值绑定,fallthrough 坠落下一个条件
    case (_,0...100): print("case3");// “_” 匹配所有
    default:break;
}

//switch 值绑定和where语句
var condition3 = 100
switch condition3{
    case let i where i<50 :print("case1")
    case let i where i<120 && i>50 :print("case2")
    default :break;
}

//switch 枚举
enum BarCode{
    case UPCA(Int,Int,Int)
    case QRCode(String)
}
var condition4 = BarCode.UPCA(10, 5, 2)
switch condition4{
    case let .UPCA(a,b,c): print("a:\(a)|b:\(b)|c:\(c)")
    case .QRCode: print("case:2")
//    default: break
}

//对option的判断
let num: Int? = nil
switch num {
    case nil: println("没值")
    default:  println("\(num!)")
}

````



##函数

````swift

//无参数
func hello(){}

//有参数
func hello(name:String){}

//有参数和返回值
func hello(name:String)->String{}

//多个参数
func hello(name:String,age:Int){}
    
//多个返回值
func hello()->(String,Int){
    return (num1,num2,num3)
}

//可变参数
func hello(name:String...){}

//函数的嵌套
func hello1(){
    func hello2(){}
}

//参数的默认值
func hello1(msg:String = "defaultMsg"){}

//返回值是函数
func hello()->(String->String){
     func hello1(name:String)->String{}
     return hello1
}


//参数是函数
fun hello(msg:String,callback(Void->Void)){
    callback()
}

//函数参数是变量
//若不声明var ，默认参数类型是let，就无法修改参数的值
func hello(var msg:String){
    msg += "hello"
    print(msg)
}

//函数参数的命名
func hello(name name:String ,withAge age:Int){}
func hello1(name:String ,age:Int){}
//调用
hello(name:<String>, withAge:<Int>)//默认的参数命名
hello1(<name:String  String>, age: <Int>)//指定的参数命名

//匿名函数
//{}可以作为匿名函数
//例如调用上面的hello方法（参数是函数）
hello("hi",
    {
     //dosthing
    }
)

//有参数的匿名函数
{
    (msg:String)->String in
    return msg
}

//泛型参数
//输入输出参数的函数
func myswap<T>(inout obj1:T,inout _ obj2:T){
    let temp:T = obj1
    obj1 = obj2
    obj2 = temp
}


````

##闭包

````swift

var array = ["f","a","c","d","e"]

//完整写法
//{ (参数:类型) in 执行方法 return 返回值}
array.sort({
    (s1:String,s2:String) -> Bool in
    return s2 > s1;
})

//省略参数类型和括号
//{ 参数$1,$2 in 执行方法 return 返回值}
array.sort({
    s1,s2 -> Bool in
    return s1 > s2;
})

//省略参数类型和return关键字
//{ 参数$1,$2 in 返回值}
array.sort({
    s1,s2 ->Bool in
    s1 < s2
})

//省略参数名
array.sort({
    $1 < $0
})

//尾随闭包
array.sort(){
    $1 < $0
}


//上面的几个其实只是匿名函数，不是真正的闭包。swift里面称他们是闭包，那就算是吧。真正的闭包是下面这个
//闭包（closure）就是封闭的意思
//闭包的概念,闭包概念有很多，我觉得比较好理解的的是松本行弘给的定义：将局部变量这一环境封闭起来的结构，叫做闭包
func count()->(()->Int){
    var i = 0;
    return {
        ()->Int in
        return ++i
    }
}
//测试使用
var touch = count()
touch()//1
touch()//2
touch()//3
touch()//4

````



## 异常处理

````swift
enum AwfulError: ErrorType {
    case Bad
    case Worse
    case Terrible
}

func hello () throws{
    throw AwfulError.Bad
}

do {
    try hello()
    print("final")
}
catch AwfulError.Bad {
    print("Bad")
}
catch AwfulError.Worse {
    print("Worse")
}
catch AwfulError.Terrible {
    print("Terrible")
}
catch  {
    print("all error")
}
````
## 断言

````swift
assert(assert(<condition:Bool Bool>)
assert(<condition: Bool Bool>, <message: String String>)
assertionFailure()
assertionFailure(<message: String String>)
````
## typealias 
> 这个关键字可以给类，结构，枚举等增加别名，也常常用于合并协议后的别名
typealias PetLike = protocol<KittenLike, DogLike>

## 编译标记
//MARK : 
//MARK -: 
// TODO: 
// FIXME:

## Selector
> objc里面有@Selector(),在swift可以使用 let someMethod = Selector("someMethodName")得到。大多数情况无需这样

````swift

    func callMe() {
        NSLog("this is callMe")
    }
    
    func callMeWithParam(timer:NSTimer) {
       NSLog("this is callMeWithParam,prarm is :\(timer.userInfo as! String)")
    }
   
    //无参数
    NSTimer.scheduledTimerWithTimeInterval(2, target:self, selector:"callMe", userInfo: nil, repeats: true)
    //带参数,不使用Selector
    NSTimer.scheduledTimerWithTimeInterval(2, target:self, selector: "callMeWithParam:", userInfo: "i'm prarm", repeats: true)

````

## 扩展

````swift
extension Person{
    func anotherHello(){
        NSLog("another hello")
    }
}
````

## defer
>   defer{} 可以将大括号中的代码段延迟到它所在的作用于结束后在执行

````swift
    print("1-1")
    defer{
      print("1-2")
    }
    print("1-3")

    输出：
        1-1
        1-3
        1-2
````

## Guard
>   guard充当了警卫员一职，保证条件满足情况下，才会让你通过，否则只能else让你返回了！切记else中一定需要有返回的语句，比如return、continue、break、throw这种提早退出的关键字

````swift

  // 这里使用if 和 guard进行对比 你会懂的更多
  if age < 13 {
      return  //当年龄小于13时 程序返回 不进行之后的操作
  }

  guard age >= 13 else{
    return
  }

````

#（三）高级


##柯里化 (Currying)
> 柯里化是一种量产类似方法的好办法，可以通过柯里化一个方法模板来避免写出很多重复代码

````swift
func addTwoNumbers(a: Int)(num: Int) -> Int {
    return a + num
}
let addToFour = addTwoNumbers(4)    // addToFour 是一个 Int -> Int
let result = addToFour(num: 6)      // result = 10
````

## 封装局部变量
> 封装局部变量可以减少变量之间的冲突

````swift
var str:String = {
    //局部变量被封装
    let str1 = "hello",str2 = "world"
    return "\(str1) \(str2) !"
}()
````


## 方法调用的另一种方式

````swift

class Person {
    func hello(name:String) -> String{
        return "hello \(name)"
    }
}

let person = Person()

//常规方法调用
person.hello("liuyanwei")

//利用方法名调用
let funcOnPerson = Person.hello
funcOnPerson(person)("liuyanwei")

````

##swift单例标准写法
````swift
private let sharedInstance = MyManager()
class MyManager  {
    class var sharedManager : MyManager {
        return sharedInstance
    }
}
````


