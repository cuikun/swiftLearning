//: Playground - noun: a place where people can play

import UIKit

//collection types

// Array 是有序集合
// Set 无序集合
// Dictionary 无序键值对集合
// 都是 genric colletion


// Arrays

// 数组存储有序类型相同的值，一个值可在数组的不同位置出现多次。
// Array

//TODO: Working with Cocoa Data Types  https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/WorkingWithCocoaDataTypes.html#//apple_ref/doc/uid/TP40014216-CH6

//TODO: Using Swift with Cocoa and Objective-C (Swift 4.1). (https://developer.apple.com/library/content/documentation/Swift/Conceptual/BuildingCocoaApps/index.html#//apple_ref/doc/uid/TP40014216)

//Array Type Shorthand Syntax

//全称 Array<Element>
//简写 [Element]

// Creating an Empty Array

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")
someInts.append(33)
// someInts now contains 1 value of type Int
someInts = []
// someInts is now an empty array, but is still of type [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles  is of type [Double] , and equals [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppList: [String] = ["Eggs", "Milk"]
// shoping list has been initializde with two initial items

print("the shopping list contains \(shoppList.count) items.")

if shoppList.isEmpty {
    print("the shopping list is empty")
} else {
    print("the shopping list is not empty")
}

shoppList.append("Flour")

shoppList += ["Baking Pwoder"]

shoppList += ["Chocolate Spread", "Cheese", "Butter"]


var firstItem = shoppList[0]

shoppList[0] = "Six eggs"
shoppList

//shoppList[4...6] = ["Bananas", "Apples"]
shoppList

shoppList.insert("maple syrup", at: 0)

let mapleSyrup = shoppList.remove(at: 0)
shoppList

// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple syrup
// the mapleSyrup constant is now equal to the removed "Maple syrup"

let apples = shoppList.removeLast()

shoppList.first
shoppList.last
shoppList.count
shoppList

// Iterating Over an Array
for item in shoppList {
    print(item)
}

//for (index, item) in shoppList.enumerated() {
//    if index == 1  {
//        shoppList.insert("3333", at: index)
//        shoppList.remove(at: 2)
//    }
//    print(item)
//}
//shoppList

//for item in shoppList {
//    if item == "3333" {
//        shoppList.insert("2222", at: 3)
//    }
//    print(item)
//}

//数组放到循环里面的已经复制过去了，不会因为循环括号内部操作而变化，大括号外面的进入循环的时候已经定了
for (index, item) in shoppList.enumerated() {
    if item.hasPrefix("B"){
        shoppList.insert("222",at: index)
    }
    if item.hasPrefix("C"){
        shoppList.remove(at: index)
    }
}
shoppList

// Sets

// distinct ， same type ，no define ordering

// 不同的元素，相同的类型，没有顺序

//在 item 的顺序不重要和 想要保证一个集合里面的元素是唯一的，可以用Set 代替Array

class key:Hashable {
    var hashValue: Int = Int(Date().timeIntervalSince1970*1000000)
    
    static func ==(lhs: key, rhs: key) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
let key1 = key()
let key2 = key()
let key3 = key1
key1.hashValue
key2.hashValue

key1 == key2

key1 == key1

key1 == key3


var letters = Set<Character>()

print("lettters is of type Set<Character> with \(letters.count) items")
letters.insert("a")
letters = []
// letters is now an empty set ,but is still of type Set<Character>

var favoriteGenres:Set<String> = ["Rock", "Classical", "Hip hop"]

// 不同类型的元素组成的数组需要显示指出
let a = ["",0,letters] as [Any]

print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not pickey")
} else {
    print("I have particular music preferences")
}

favoriteGenres.insert("Jazz")
// favortieGenres noew contains 4 items

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much care for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here")
}

// 遍历Set
for genre in favoriteGenres {
    print("\(genre)")
}

var aa:Set<Int> = [1,2,3,4,5,6]

var bb:Set<Int> = [4,5,6,7,8,9]

aa.intersection(bb).sorted()
aa.symmetricDifference(bb).sorted()
aa.union(bb).sorted()
//aa.subtract(bb)
//bb.subtract(aa)
bb.subtracting(aa).sorted()
aa.subtracting(bb).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)


//Dictionaries

// write in full : Dictionary<Key, Value>

//var airports:[String:String] = ["YYZ":"Toronto Pearson", "DUB": "Dublin"]

var airports = ["YYZ": "Toronto Person", "DUB": "Dublin"]

var example = ["one": 1, "two": 2]

airports.count

airports.isEmpty

airports["LHR"] = "London"
airports

airports["LHR"] = "London heathrow"
airports

// 这个是有返回值的，可以用来判断是否更新了，返回的是之前的
airports.updateValue("lcc", forKey: "LHR")

if let oldValue = airports.updateValue("Dublin Airports", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

airports["APL"] = "Apple International"
airports
airports["APL"] = nil
airports

if let removeValue = airports.removeValue(forKey: "DUB")
{
    print("the remove airports name is \(removeValue)")
}


for (airportCode, airportName) in airports {
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

