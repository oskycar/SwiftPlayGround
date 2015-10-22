//使用 for-in 循环来遍历一个集合里面的所有元素
// index 是一个每次循环遍历开始时被自动赋值的常量。这种情况下, index 在使用前不需要声 明,只需要将它包含在循环的声明中,就可以对其进行隐式声明,而无需使用 let 关键字声明
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//如果你不需要知道区间内每一项的值,你可以使用下划线( _ )替代变量名来忽略对值的访问:
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base }
print("\(base) to the power of \(power) is \(answer)")

//标准样式的for循环
//在初始化表达式中声明的常量和变量(比如 var index = 0 )只在 for 循环的生命周期里有效
for var index = 0; index < 3; ++index {
    print("index is \(index)")
}

//滑道和梯子游戏
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

//while版本的实现
var square = 0
var diceRoll = 0
while square < finalSquare {
    // 掷骰子
    if ++diceRoll == 7 { diceRoll = 1 } // 根据点数移动
    square += diceRoll
    if square < board.count {
        // 如果玩家还在棋盘上,顺着梯子爬上去或者顺着蛇滑下去
        square += board[square] }
}
print("Game over!")


//repeat while 版本的实现, 类似do while
square=0
diceRoll=0
repeat {
    // 顺着梯子爬上去或者顺着蛇滑下去 square += board[square]
    // 掷骰子
    if ++diceRoll == 7 { diceRoll = 1 } // 根据点数移动
    square += diceRoll
} while square < finalSquare
print("Game over!")

//switch用法
let someCharacter: Character = "e"
switch someCharacter {
//case "1": swift不允许case空串行判断，每个分支后面都必须包含至少一条语句
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
default:
            print("\(someCharacter) is not a vowel or a consonant")
}

//switch中的区间匹配 ...是闭区间 ,  ..<是左闭右开区间
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount =  "many"
}

print("There are \(naturalCount) \(countedThings).")

//switch中使用元组匹配
//可以使用元组在同一个 switch 语句中测试多个值。元组中的元素可以是值,也可以是区间。另外,使用下划 线( _ )来匹配所有可能的值
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
//Swift 允许多个 case 匹配同一个值。实际上,在这个例子中,点(0, 0)可以匹配所有四个 cas e。但是,如果存在多个匹配,那么只会执行第一个被匹配到的 case 分支。考虑点(0, 0)会首先匹配,因此剩下的能够匹配(0, 0)的 case 分支都会被忽视掉


//switch中的值绑定
//将匹配的值绑定到一个临时的常量或变量,这些常量或变量在该 case 分支里就可以被引用

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
//因为最后一个 case —— case let(x, y) 声明了一个可以匹配余 下所有值的元组。这使得 switch 语句已经完备了,因此不需要再书写默认分支
}

//where在switch中的使用
//下面的例子把下图中的点(x, y)进行了分类:
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

//fallthrough 在switch中的使用
//￼ fallthrough不会检查它下一个将会落入执行的 case 中的匹配条件。 简单地使代码 执行继续连接到下一个 case 中的执行代码,
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 25:
    description += " 25 "
    fallthrough
default:
    description += " an integer."
}

print(description)

//标签在循环体中的使用
firstloop: for i in 0...3{
    for j in 0...3{
        if  (i+j)%2==0{
            print(i,j)
            continue firstloop //直接跑到外层循环去继续执行了，而不是继续当前循环
        }
    }
}

forloop: for i in 1...10 {
    switch i {
    case let x where x%4==0:
        print(x)
        break forloop;
    case let x where x%3==0:
        print(x)
        continue forloop
    default:
        break
    }
}

//guard关键词与if类似，只是要求必须有else与之配对
func greet(person: [String: String]) { guard let name = person["name"] else {
    return }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name": "John"])
greet(["name": "Jane", "location": "Cupertino"])


//检测API是否可用,格式：`platform name` `version`
//最后一个参数, * ,是必须的,用于处理未来可能的其他平台
if  #available(iOS 9, OSX 10.10,*) {
    print("在 iOS 使用 iOS 9 APIs , 并且在 OS X 使用 OS X v10.10 APIs")
} else {
    print(" 回滚至早前 iOS and OS X 的API")
}











