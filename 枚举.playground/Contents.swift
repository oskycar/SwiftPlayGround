//示例一：像类和其他所有命名类型一样,枚举可以包含方法
enum Rank:Int {
    case Ace=1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
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

let ace = Rank.Ace
let aceRawValue = ace.rawValue
ace.simpleDescription()


//示例二：枚举成员可以有示例值，类似于带参数的枚举,枚举比较时会同时比较原始值和参数值
//带参数的枚举是无法取到其原始值得，即rawValue属性不可用
//考虑从服务器获取日出和日落的时间。服务器会返回正常结果或者错误信息

enum ServerResponse {    case Result(String, String)    case Error(String, String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("out of cheese","6:00am")
let othertime = ServerResponse.Result("7:00 am", "18:09 pm")

var  sr:ServerResponse
sr = success
//sr.rawValue  这是个错误，单参数的枚举不能取原始值
switch success {
case ServerResponse.Result("6:00 am", "8:09 pm"):
    println("success")
case ServerResponse.Result("7:00 am", "18:09 pm"):
    println("other time ")
case ServerResponse.Error("6:00 am", "8:09 pm") :
    println("failure")
default:
    println("others")
}




