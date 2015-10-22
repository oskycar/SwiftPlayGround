//: Playground - noun: a place where people can play

import UIKit

//序列类型包括Arrays、Sets、Dictories

var someInts = [Int]()
//构造空数组，由于定义时指定为Int，因此someInts置空后依旧是Int类型
someInts = []
someInts = [1,2,3,4]
someInts.append(5)
print("someInts is of type [Int] with \(someInts.count) items.")

//创建一个带有默认值的数组
var threeInts = [Int](count: 3, repeatedValue:0)

//合并相同类型的数组
var sixint = threeInts + someInts
var tmpint = [6,7]
sixint += tmpint

sixint[0...2]=[11]  //切片操作会将原来下标索引范围内的值替换掉
sixint.removeLast() //用.符号查看array上支持的函数功能

//遍历序列类型的两种方法，enumerate的方法在2.0中有变化
for item in sixint
{
    print(item)
}

//for (index,value) in enumerate(sixint) swift 1.0的方式
for (index,value) in sixint.enumerate()
{
    print("item \(index+1) : \(value)")
}

