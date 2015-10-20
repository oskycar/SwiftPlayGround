//可选值的一个示例

let possibleNumber = "-123"
//toInt 方法可能会失败,所以它返回一个可选的(optional)Int,可选的 Int 被写作 Int?而不是 Int。问号暗示包含的值是可选,也就是说可能包含 Int 值也可能不包含值
let convertedNumber = possibleNumber.toInt()

//println("\(convertedNumber!)") 强制解包会在可选值返回nil时导致程序崩溃

if convertedNumber != nil {
    //当你确定可选包确实含值之后,你可以在可选的名字后面加一个感叹号(!)来获取值
    println("\(possibleNumber) has an integer value of \( convertedNumber! )" )
}
else
{
    println("\(possibleNumber) cann't be converted to an integer")
}

//可选绑定示例：使用可选绑定(optional binding)来判断可选是否包含值,如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在 if 和 while 语句中来对可选的值进行判断并把值赋给一 个常量或者变量, 在后面的代码中可以使用绑定的变量/常量
//if  let num = convertedNumber {
if var num = convertedNumber {
    println("\(possibleNumber) has an integer value of \( num )" )
}else{
    println("\(possibleNumber) cann't be converted to an integer")
}

let  str = "123你好!??"
println(str+"has \( count(str) ) charaters")
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"








