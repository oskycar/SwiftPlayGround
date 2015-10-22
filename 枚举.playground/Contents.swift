//示例一：像类和其他所有命名类型一样,枚举可以包含方法
enum Rank:Int {
    case Ace=1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    //case Other(String,String)  这里的枚举强制指定为Int类型，因此不能有带参数的枚举值
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
                return "ace"
        case .Jack:
                return "jack"
        case .Queen:
                return "queen"
        case .King:
                return "king"
        default:
            return String(self.rawValue)
        }
    }
}
print("Rank.Ace value is \(Rank.Ace.rawValue)") //case中的枚举值得字面量是按顺序自动递增的
print("Rank.Two value is \(Rank.Two.rawValue)")
print("Rank.Ten value is \(Rank.Ten.rawValue)")
let ace = Rank.Ace
let aceRawValue = ace.rawValue
ace.simpleDescription()

//只有无类型指定的枚举才可以把无参和有参的枚举值写在一起
enum NoRawValue{
    case V1
    case V2
    case V3(String,String)
    func description()->String{
        switch self {
        case .V1:
            return "this is V1"
        case .V2:
            return "this is V2"
        case .V3("hello", "world"):
            return " this is V3.hello world"
        default:
            return ""
        }
    }
}
print(NoRawValue.V1)
print(NoRawValue.V3("hello", "world").description())

//对于非整形的枚举，如果第一个枚举值是自定义的，那么后续的枚举值的值也必须手动指定
enum HasRawValue:Double{
    case V1 = 1.0
    case V2 = 2.3
}

HasRawValue.V2.rawValue


//示例二：枚举成员可以有示例值，类似于带参数的枚举,枚举比较时会同时比较原始值和参数值
//带参数的枚举是无法取到其原始值得，即rawValue属性不可用
//考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息

enum ServerResponse{
    case Result(String, String)
    case Error(String, String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("out of cheese","6:00am")
let othertime = ServerResponse.Result("7:00 am", "18:09 pm")

var  sr:ServerResponse
sr = success
//sr.rawValue  这是个错误，单参数的枚举不能取原始值
switch success {
case ServerResponse.Result("6:00 am", "8:09 pm"):
    print("success")
case ServerResponse.Result("7:00 am", "18:09 pm"):
    print("other time ")
case ServerResponse.Error("6:00 am", "8:09 pm") :
    print("failure")
default:
    print("others")
}




