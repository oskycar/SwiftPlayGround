//定义集合时，其模板类型必须同时指定，不能省略
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//用数组来创建集合,重复的元素会自动过滤掉
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop","Rock"]
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("Art")
print(favoriteGenres.remove("Rock"))
favoriteGenres.contains("Art")

for type in favoriteGenres{
    print(type)
}
//按顺序访问
for type in favoriteGenres.sort(){
    print(type)
}

//集合的操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

//相等判断，子父判断
let houseAnimals: Set = ["1", "2"]
let farmAnimals: Set = ["1", "2", "3", "4", "5"]
let cityAnimals: Set = ["6", "7"]
houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals) //判断是否不含有相同的值
