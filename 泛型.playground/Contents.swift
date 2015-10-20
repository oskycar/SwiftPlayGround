//定义一个泛型函数，将某个参数重复n次后输出
func repeatValues<T>(item:T , times:Int) -> [T]{
    
    var result = [T]()
    for i in 0...times{
        result.append(item)
    }
    return result;
}

repeatValues("hello", times:4)
repeatValues(2, times:4)
repeatValues((1,2), times:4)
repeatValues(["key":"value"], times:4)


//也可以创建泛型类、枚举和结构体
enum OptionalValue<T>{
    case None
    case Some(T)
}
var possibleInteger:OptionalValue<Int> = OptionalValue.None
possibleInteger = OptionalValue.Some(100)

//泛型的类型可以通过where进行限定，比如要限定实现一个协议的类型,需要限定两个类型要相同,或者限定一个类必须有一个特定的父类

//该函数用来检测两个输入数组中是否存在公共项目
func anyCommonElements <T,U where T:SequenceType, U:SequenceType,
    T.Generator.Element:Equatable,T.Generator.Element == U.Generator.Element  > (lhs: T, rhs: U) -> Bool {
        
        for lhsItem in lhs {
            
            for rhsItem in rhs {
                if lhsItem == rhsItem
                {
                    return true
                }
            }
        }
        
        return false
}

var k = anyCommonElements([1,2,3], rhs:[3])

//该函数返回一个数组,内容是两个序列 的共有元素。
func getCommonElements <T,U where T:SequenceType, U:SequenceType,
T.Generator.Element:Equatable,T.Generator.Element == U.Generator.Element  > (lhs: T, rhs: U) -> [T.Generator.Element] {
    
    var temp:[T.Generator.Element]=[]
    for lhsItem in lhs {
        
        for rhsItem in rhs {
            if lhsItem == rhsItem
            {
                temp.append(rhsItem)
            }
        }
    }
    
    return temp
}

var temp = getCommonElements([1,2,3], rhs:[3,2])

var temp2 = getCommonElements(["a","b","c"], rhs:["c"])



