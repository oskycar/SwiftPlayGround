//定义一个protocol，包括一个变量和一个可以修改自身变量值得函数adjust
//mutating关键字表示该函数可以修改类中的变量值
protocol ExampleProtocol {    var simpleDescription: String { get }    mutating func adjust()
}

//实现了protocol的类，adjust方法不需要mutating关键字，因为是类方法了
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription+="  Now 100% adjusted"
    }
}

var a = SimpleClass();
a.adjust()
let aDescription = a.simpleDescription

//实现了protocol的结构体，adjust必须需要mutating关键字，因为是普通方法
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A very simple structure."
    mutating func adjust() {
        simpleDescription+="   adjusted"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


//使用 extension 来为现有的类型添加功能,比如为Int类添加一个计算属性的方法
extension Int:ExampleProtocol {
    var simpleDescription:String{
        return "The number is \(self)"
    }
    mutating func adjust() {
            self+=42
    }
}
var  testInt:Int = 12
testInt.simpleDescription
testInt.adjust()

/*1 扩展可以添加新的计算属性，但不能添加存储属性，也不能向已有属性添加属性观察。
2  扩展方法类型有：类方法（引用类型）、静态方法（值类型）和实例方法、修改实例方法
*/

