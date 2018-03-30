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

shoppList[4...6] = ["Bananas", "Apples"]
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

for (index, item) in shoppList.enumerated() {
    if index == 1  {
        shoppList.insert("3333", at: index)
        shoppList.remove(at: 2)
    }
    print(item)
}
shoppList










