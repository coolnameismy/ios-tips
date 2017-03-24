## 常见的二进制类型

typedef uint8_t  BYTE;
typedef uint32_t DWORD;
typedef int32_t  LONG;
typedef uint16_t WORD;


int8_t flag = 0b10000000;
int8_t flag1 = (flag & 0b01111111) | 0b00000011;

变量结果：
flag	int8_t	'\x80'
flag1	int8_t	'\x03'

1、2月15提供第一个版本，该版本包含蓝牙广播、服务定义，传输数据拆包，组包以及导出给用户的API
2、2月底 SDK增加据安全部分代码
3、三月底实现OTA

## 数据转换
	
//uint8_t转换到NSUInteger
NSUInteger i = (NSInteger)length;

//byte->NSInteger
Byte b = 123;
NSInteger x;
x = b;


##  数据操作 
> 数据操作主要分为三种类型，分别是字节流操作(NSData) 字节操作(Byte) 位操作（bit）

1：直接用byte数组或byte写，例如：
byte buffer = {0x1e,0x07,0x01,0x01,0x02,0x03};
byte day = {0x01};

2:使用NSMutableData写数据
NSMutableData *temp = [[NSMutableData alloc]init];
Byte a1[] = {0x1e,0x07};
Byte a2 = 0x01;
Byte a3 = 0x01;
Byte a4 = 0x02;
Byte a5 = 0x03;
[temp appendBytes:&a1 length:2];
[temp appendBytes:&a2 length:1];
[temp appendBytes:&a3 length:1];
[temp appendBytes:&a4 length:1];
[temp appendBytes:&a5 length:1];
//结果: <1e070101 0203>

3：写byte

 

4:data数据操作

比较： [data isEqualToData:actualData]
写入： [data appendBytes:&a1 length:2];
截取： [data subdataWithRange:NSMakeRange(200, 500)];
前排插入byte的黑科技~：[data replaceBytesInRange:NSMakeRange(0, 0) withBytes:&byte length:2];

5:crc校验

#import <zlib.h> //需要导入libz.tbd

NSData *data;

// ...

unsigned long result = crc32(0, data.bytes, data.length);
NSLog(@"CRC32: %lu", result);


## bit操作

假设flag是一个byte位的数据，` int8_t flag = 0b00000000; `

- 获取bit位数据

`uint8_t encrypt =   (flag & 0b00010000) >> 4; `

说明：先用&操作去除其他flag其他无用的bit位，只保留第bit5位置，然后在右移动四位，转成int，得到结果就是0或1

- bit位赋值

例如给flag的第4个bit位赋值,可以使用位与运算, flag = flag | 0b00010000;


### 例子：

````
Byte flag = [ALUntil composeFlagWithID:14 preset:YES complex:YES encrypt:YES];
uint8_t msgID = flag & 0b00001111;
//encrypt
uint8_t encrypt =   (flag & 0b00010000) >> 4;
//encrypt
uint8_t isComplex = (flag & 0b00100000) >> 5;
//encrypt
uint8_t preset =   (flag & 0b01000000) >> 6;
````

## 注意点

1：初始化data时，如果byte的数据不够，后面的数据会随机生成，有时会带来潜在的bug
    
    NSData *data = [[NSMutableData alloc]initWithLength:40];
    Byte datatime[] = {0x1e,0x07,0x01,0x01,0x02,0x03}; //2017-01-01 2:03
    NSData *data1 = [NSData dataWithBytes:&datatime length:40];

data: <00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000>
data1:<1e070101 0203401b 03000061 0000601d 03000061 00006098 835aff7f 00004cb4 f3050100 00006098>



## 参考

- [difference-between-sizeof-and-length-of-nsdata](http://stackoverflow.com/questions/25624633/difference-between-sizeof-and-length-of-nsdata)
