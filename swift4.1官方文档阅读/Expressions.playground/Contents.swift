import UIKit

func f(_ any: Any) { print("Function for Any")}
func f(_ int: Int) { print("Function for Int")}
let x = 10

f(x)

let y: Any = x
f(y)

f(x as Any)

func logFunctionName(string: String = #function) {
    print(string)
}

func myFunction() {
    logFunctionName() // prints "myFunction()".
}
myFunction()

var emptyArray: [Double] = []
var emptyDic: [String: Double] = [:]


class SomeClass {
    var greeting: String
    init(greeting: String) {
        self.greeting = greeting
    }
}

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double,y deltax: Double) {
        self = Point(x: x + deltaX, y: y + deltaX)
    }
}


func myClosure(_ closure: (Int,Int) -> Int){
    closure(1,2)
}

myClosure { (x, y) -> Int in
    return x + y
}

myClosure { x,y in
    return x + y
}

myClosure {
    return $0 + $1
}

myClosure { $0 + $1 }

var a = 0
var b = 0
let closure = {[a] in
    print(a,b)
}
a = 10
b = 10
closure()

class SimpleClass {
    var value: Int = 0
}

var sc = SimpleClass()
var sc1 = SimpleClass()
let closure1 = {[sc] in
    print(sc.value, sc1.value)
}
sc.value = 10
sc1.value = 10
closure1()

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {(number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

struct SomeStruct {
    var someValue: Int
}

let s = SomeStruct(someValue: 12)
let pathToProperty = \SomeStruct.someValue
let value =  s[keyPath:pathToProperty]
// value is 12

class SomeClass1: NSObject {
    @objc var somePropery: Int
    init(somePropery: Int) {
        self.somePropery = somePropery
    }
}

let  c = SomeClass1(somePropery: 10)

c.observe(\.somePropery) { (object, change) in
    
}

struct OuterStruceture {
    var outer: SomeStruct
    init(someValue: Int) {
        self.outer = SomeStruct(someValue: someValue)
    }
}

let nested = OuterStruceture(someValue: 24)
let nestedPath = \OuterStruceture.outer.someValue
let nestedValue = nested[keyPath:nestedPath]


let greetings = ["hello", "hola", "bonjour", "안녕"]
let myGreeting = greetings[keyPath:\[String].[1]]

var index = 2
let path = \[String].[index]
let fn: ([String]) -> String = {strings in strings[index]}

print(greetings[keyPath:path])
print(fn(greetings))

index += 1
print(greetings[keyPath: path])

print(fn(greetings))

let firstGreeting: String? = greetings.first
print(firstGreeting?.count as Any)

let count = greetings[keyPath:\[String].first?.count]
print(count as Any)

let interestingNumbers = ["prime": [2, 3, 5, 7, 11, 13, 17],
                          "triangle": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
print(interestingNumbers[keyPath: \[String: [Int]].["prime"]] as Any)

print(interestingNumbers[keyPath: \[String:[Int]].["prime"]![0]])
print(interestingNumbers[keyPath: \[String: [Int]].["hexagonal"]!.count])

let greetings1 = [["hello"], ["hola"], ["bonjour"], ["안녕"]]
let myGreeting1 = greetings1[keyPath: \[[String]].[1][0]]

class SomeClass2 {
    @objc let propery: String
    @objc(doSomethingWithInt:)
    func doSomething(_ x: Int) {
        
    }
    init(propery: String) {
        self.propery = propery
    }
}

let selectorForMethod = #selector(SomeClass2.doSomething(_:) as (SomeClass2) -> (Int)->Void)
let selectorForProperyGetter = #selector(getter:SomeClass2.propery)

extension SomeClass2 {
    @objc(doSomethingWithString:)
    func doSomething(_ x: String){ }
}
let anotherSelector = #selector(SomeClass2.doSomething(_:) as (SomeClass2) -> (String)->Void)

class SomeClass3 {
    @objc var someValue: Int
    init(someValue: Int) {
        self.someValue = someValue
    }
}

let c3 = SomeClass3(someValue: 12)
let keyPath = #keyPath(SomeClass3.someValue)

//if let value = c.value(forKey: keyPath) {
//    print(value)
//}

let initializer: (Int) -> String = String.init
let oneTwoThree = [1, 2, 3].map(initializer).reduce("", +)

//let s1 = SomeType.init(data: 3)
//let s2 = SomeType(data: 3)

//let s3 = type(of: someType).init(data: 3)

let cc = SomeClass(greeting: "333")
let yy = cc.greeting

let xx = [10, 3, 20, 15, 4]
    .sorted()
    .filter {$0 > 5}
    .map {$0 * 100}

func f() {
    defer {
        print("First")
    }
    defer {
        print("Second")
    }
    defer {
        print("Three")
    }
}
f()

#if swift(>=3.0)
print("hahaah")
#endif

#if os(iOS) || os(macOS)
print("Hello, World!")
#endif

#if arch(i386) || arch(x86_64)
print("x86_64")
#endif

#if canImport(Foundation)
print("can import Foundation")
#endif

#if targetEnvironment(simulator)
print("simulator")
#endif

#sourceLocation(file:"myfile.swift", line:10)
print("myfile.swift")
#sourceLocation()

//#error("it is an error")
//#warning("it is an warning")

let error: String = "hahhah"
//#error("error")

enum Error: String {
    case hahah
}

//#error(Error.hahah)
//#warning("Error.hahah")

if #available(iOS 11,macOS 5, *) {
    print("then it works")
}
