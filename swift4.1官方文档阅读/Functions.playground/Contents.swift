//: Playground - noun: a place where people can play

import UIKit

// Functions

// 函数是执行一个特定任务的代码块。
// 可以写出C—style的函数，也可以写出Objective-C-Style的函数
// 可以写默认值简化函数调用，可以传递inout 类型参数
// 每个函数都有一个类型，由函数参数类型和返回类型组成
// 函数的类型可以像其他类型一样使用
// 函数可以写在其他函数内部，

func greet(person: String) -> String {
    let greeting = "Hello," + person + "!"
    return greeting
}

print(greet(person: "Anna"))

print(greet(person: "Brian"))

//可以简化为
func greetAgain(person: String) -> String {
    return "Hello again," + person + "!"
}
print(greetAgain(person: "Anna"))


// 无参数函数
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

// 多个参数的函数

func greet(person:String, alreadGreeted: Bool) -> String {
    if alreadGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadGreeted: true))

// 没有返回值的函数 和上面待返回的同名函数是混淆的
// 没有定义返回类型的函数的返回的是 Void 类型， Void 是一个空的元组，写作()
//func greet(person: String) {
//    print("Hello, \(person)!")
//}
//greet(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

// note ： 写明返回类型的必须保证能够有返回值，如果不写返回值的会导致编译错误


//多个返回值的函数
//用元组作为返回值

func minMax(array: [Int]) ->(min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return(currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")


func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}

if let bounds = minMax1(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}


func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to argument values for the first and second parameters
}
someFunction(firstParameterName: 1, secondParameterName: 2)


func someFunction(argument paramenterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter
}

func greet(person:String, from hometown: String) -> String {
    return "Hello \(person)! Glad you visit from \(hometown)"
}
print(greet(person: "Bill", from: "Cupertino"))


func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParamterName and secondParameterName
    // refer to the argument values for the first and second parameters
}

someFunction(1, secondParameterName: 2)

// Defalut Parameter Values

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}

someFunction(parameterWithoutDefault: 4)
someFunction(3, secondParameterName: 4)


// variadic Parameters , 一个函数最多只能有一个可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1,2,3,4,5))
print(arithmeticMean(3,8.25,18.75))

// in-Out parameters
func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1 }
}

func mutithreadedFunction(queue: DispatchQueue, x: inout Int) {
    // Make a loacal copy and mannually copy it back
    var localX = x
    defer {
        x = localX
    }
    // Operate on localX asynchronously, then wait before returning
    queue.async { someMutatingOpertaion(&localX)}
    queue.sync {} // wait, 用这种方法wait 感觉屌屌的
}

func someMutatingOpertaion(_ localX : inout Int) {
//    sleep(3)
    localX = 3
}

let queue = DispatchQueue(label: "test.queue")
var age = 5
mutithreadedFunction(queue: queue, x: &age)


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporary = a
    a = b
    b = temporary
}

var someInt = 3
var another = 107

swap(&someInt, &another)

print("someInt is now \(someInt), and antherInt is now \(another) ")



// Function types

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

let type = ((Int, Int) -> Int).self

func printHelloWorld() {
    print("hello world")
}

let type1 = (() -> Void).self

// using Function Types

var mathFuction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFuction(2,3))")

mathFuction = multiplyTwoInts

print("Result: \(mathFuction(2,3))")


let anotherMathFunction = addTwoInts


// Function Types as Parameter Types

func printMathResults(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}

printMathResults(addTwoInts(_:_:), 3, 5)


// Function Types as return Types

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
// Count to zero

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

// Nested Function

func chooseStepFunc(backward: Bool) -> (Int) -> Int {
    func stepFor(input: Int) -> Int { return input + 1 }
    func stepBack(input: Int) -> Int { return input - 1 }
    return backward ? stepBack : stepFor
}

var currentV = -4
let moveNearToZe = chooseStepFunc(backward: currentV > 0)
while currentV != 0 {
    print("\(currentV)...")
    currentV = moveNearToZe(currentV)
}
print("zero!")







