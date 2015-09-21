

## dictionary 使用

````objc
var dictionary1 = ["name":"liuyanwei","age":"30"];
var dictionary2 = Dictionary<String,String>();
dictionary1["height"] = "172cm ";
dictionary1.removeValueForKey("height")
dictionary1.count
````

## 循环的使用

````objc

for item in dictionary1{
    println(item);
}

var i = 0;
for index in 1...100{
    if index%2==0 {
        i += index;
        println(i);
    }
   
}

while i>0{
    i = i-100;
    println(i);
}

//字典的循环
for (key,value) in dictionary1{
    println("key is: \(key) value is : \(value)");
}

````


## 函数
````objc
//不带参数不带返回值
func showMessage(){
    println("hello world")
}

//带参数不带返回值
func showMessageWithMessage(msg:NSString){
     println("\(msg)")
}

//带返回值
func add(a:Int,b:Int)->Int{
    return a+b
}
//带多个返回值
func fetchMinAndMax(ints:[Int])->(Int,Int){
    var max:Int = ints[0];
    var min:Int = ints[0];
    for i in ints{
        
        if i > max{
            max = i        }
        if i < min{
            min = i
        }
    }
    return (min,max)
}
````

## 方法的使用

````objc
showMessage()
showMessageWithMessage("hello liuyanwei")
add(2,3)

var ints:[Int] = [32,233,3,4,645,654,77,13,8,3]

var i:Int,j:Int
(i,j) = fetchMinAndMax(ints);
//重置方法
var myfunc = showMessageWithMessage
myfunc("123");
````

