//可以把任意顺序的类型组合成一个元组,这个元组可以包含所有类型
let http404Error = (404,"Not Found")

//可以将一个元组的内容分解(decompose)成单独的常量和变量
let (statusCode, statusMessage) = http404Error
println("the status code is \(statusCode)")
println("the status message is \(statusMessage)")

//如果只需要一部分元组值,分解的时候可以把要忽略的部分用下划线(_)标记
let (justTheStatusCode,_) = http404Error
println("the status code is \(justTheStatusCode)")

//还可以通过下标来访问元组中的单个元素,下标从零开始:
println("the status code is \(http404Error.0)")
println("the status message is \(http404Error.1)")

//可以给元组中的单个元素命名，并通过名字访问
let http200Status = (statusCode:200, description:"ok")
println("the status code is \(http200Status.statusCode)")
println("the status message is \(http200Status.description)")