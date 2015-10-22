
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//由于类型一致因此类型指定可以在此省略不写
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

airports["LHR"] = "London"

//updateValue(_:forKey:) 方法会返回设置前对应值的类型的可选值
if  let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB")
{
    print("The old value for DUB was \(oldValue).")
}

//字典的下标 访问会返回对应值的类型的可选值。如果这个字典包含请求键所对应的值,下标会返回一个包含这个存在值的可 选值,否则将返回 nil
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

// 将值设置为nil，将字典中的某个键值对移除，APL 现在被移除了
airports["APL"] = nil
//通过removeValueForKey移除键值，会返回原来键值对对应的值，并且是个可选值
if let removedValue = airports.removeValueForKey("APL") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//遍历
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//通过访问 keys 或者 values 属性,我们也可以遍历字典的键或者值:
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//利用key value构造数组
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)









