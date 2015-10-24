
//函数参数都有一个外部参数名(external parameter name)和一个本地参数名(local parameter name).外部参 数名用来标记传递给函数调用的参数,本地参数名在实现函数的时候使用
func someFunction(ep firstParameterName: Int, ep secondParameterName: Int) {
    print(firstParameterName, secondParameterName)
}
//所有参数 需要有不同的本地参数名,但可以共享相同的外部参数名.
someFunction(ep: 1, ep: 2)

//默认情况下，第一个参数省略其外部参数名,第二个以后的参数使用其本地参数名作为自己的外部参数名.
func someFunction2( firstParameterName: Int,  secondParameterName: Int) {
    print(firstParameterName, secondParameterName)
}
someFunction2(2, secondParameterName: 3)

//默认参数
func someFunction(parameterWithDefault: Int = 12) {
    print(parameterWithDefault)
}
someFunction(6) // parameterWithDefault is 6 
someFunction() // parameterWithDefault is 12

func arithmeticMean(numbers: Double...) -> Double { var total: Double = 0
    for number in numbers {
        total += number }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

//函数参数默认是常量,不过可以通过var来指定参数为可变参数，该参数可以在函数内部修改，但是函数调用返回后保留原值，因为函数内进行了值拷贝
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

let oriStr = "helloworld"
let padStr = alignRight(oriStr, totalLength: 20, pad: "=")
oriStr  //oriStr在函数内部被修改，但是函数返回后并不影响原值 

//输入输出参数
//函数的参数在调用返回后其值会被修改，类似于指针调用方式,调用时要用到取地址符&
//定义一个输入输出参数时,在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值,这个值被函数修 改,然后被传出函数,替换原来的值。
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var a = 3
var b = 4
swapTwoInts(&a, &b)
print(a)
print(b)


//函数类型，由函数的参数类型和返回类型组成。可以当做普通类型来定义变量，用作返回值
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}
var mathFun:(Int,Int)->Int = addTwoInts;
print(mathFun(1,2))
mathFun = multiplyTwoInts
print(mathFun(1,2))

let otherFun = addTwoInts //函数类型也可以省略不写，编译器会自动推断出来
otherFun(2,3)

func printMathResult(mathFunction:(Int,Int)->Int, a:Int,b:Int)//用函数类型定义的参数
{
    print("Result is \(mathFunction(a,b))")
}

printMathResult(addTwoInts ,a: 3, b: 4)
printMathResult(multiplyTwoInts,a:3,b:4)

//函数类型可以当做返回值返回
//下面代码实现了如下功能，可以自动找到最合适的递增或递减函数将输入值逐渐趋于零输出
func chooseStepFun(isPositiveNum:Bool)->(Int)->Int
{

    func forward(param:Int)->Int { return param +  1}
    func backward(param:Int)->Int { return param -  1}
    return isPositiveNum ? backward : forward;
}
print("Countting to zero...")
var curValue = 13
let moveFun = chooseStepFun(curValue>0)

while curValue != 0{
    print(curValue)
    curValue = moveFun(curValue)
}

