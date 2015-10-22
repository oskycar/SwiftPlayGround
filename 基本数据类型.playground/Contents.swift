
//变量/常量名可以是任意UNICODE字符
var 我是个变量:Int = 32

//各种Int
UInt8.max
UInt8.min
UInt64.max
UInt32.max
UInt16.max
Int64.max
Int.max

//进制
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
/*
浮点小数在16进制中用p表示，
*/
1.25e2
0xFp2
0xFp-2

//下面的这些浮点字面量都等于十进制的 12.1875:
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
//十六进制小数的计算方式:将12.1875，分成整数和小数部分,分别计算12和0.1875对应的表示
//整数部分用整数的16进制计算，小数部分用xpy的方式计算，xpy = x*(1/16)*2^y
//因此12.1875 = 12 + 3p0 = 12+ 3*(1/16)*2^0  ；注意是用3乘而不是0.3
var kk = 3.0/16

//整数和浮点数可以包含额外的0和下划线以增强可读性，并且不影响字面量
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
let bitNum = 200_299_298_111_888_112

//数值类型转换
//不同的数值类型存储不同的范围的数字，如果超出其范围则会报错
//let cannotBeNegative:UInt8 = -1 不能是负数

//不同类型的变量/常量计算时需要类型转换
let numUInt16:UInt16 = 2_000
let numUInt8:UInt8 = 1
let sum = numUInt16+UInt16(numUInt8)

let numFloat:Float = 3.0
let numDouble:Double = 1.02
let sum2 = Double(numFloat) + numDouble

//类型别名: 可以为现有类型通过typealiase关键字定义另一个名字
typealias AudioSample = UInt16
typealias VideoSample = AudioSample
var maxASample = AudioSample.max
var maxVSample = VideoSample.max




















