import UIKit

let `let` = "let"
var `var` = "var"

let count = `let`.count
let varCount = `var`.count

class `Class` {
    var name = "name"
    var height = "height"
}

let `class` = Class()

// #colorLiteral #fileLiteral #imageLiteral

42 // Interger literal
3.14159 // Floating-point literal
"Hello, world!" // String literal
true // Boolean literal



infix operator +-=: myPrecedence
precedencegroup myPrecedence {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    assignment:true
    associativity: left
}

struct Vector2D {
    var x:Double = 0.0, y:Double = 0.0
}

extension Vector2D {
    static func +-= (left: inout Vector2D, right: Vector2D) {
        left = Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

var firstVector:Vector2D? = nil
let secondVector =  Vector2D(x: 3, y: 4)
firstVector? +-= secondVector

let x = -3333

let y = 0b010_1001
let z = 0o23_2737_1361
let a = 0x1893_8794_7129_487a

let b = 1.25e3
let c = 0x1p-2

let string = """
    aaajfiajfafsajfa;f;ajfa;fjas;flkjas;fjas;fdafja;sfaksf\
    jifajfla;sfjas;eifja;efajsef
    fjeifjeif
    """
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var customProviders:[()->String] = []
func collectCustomerProviders(_ customProVider: @autoclosure @escaping () -> String) {
    customProviders.append(customProVider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customProviders.count) closures")

var someTuple = (top: 10, bottom: 12) //some Tuple of (top:Int, bottom: Int)
someTuple = (top: 4, bottom: 42) // ok , names match
someTuple = (9, 99) // ok, name are inferred
//someTuple = (left: 5, right: 5) // Error: name don't match

(Int,Int).self


func someFunction(left: Int, right: Int) { }
func anotherFunction(left: Int, right: Int) { }
func functionWithDifferentLabels(top: Int, bottom: Int) { }

var f = someFunction // The type of f is (Int, Int) -> Void
f = anotherFunction // OK
f = functionWithDifferentLabels // OK

func functionWithDifferentArgumentTypes(left: Int, right: String){ }

//f = functionWithDifferentArgumentTypes // Error

func functionWithDifferentNumberOfArguments(left: Int, right: Int, top: Int){
}

//f = functionWithDifferentNumberOfArguments // Error

//var operation: (lhs: Int, rhs: Int) -> Int // Error

var operation: ((_ lhs: Int, _ rhs: Int) -> Int)? // OK

var operation1: ((Int, Int) -> Int)? // OK


func functionName() throws {
    try FileManager.default.attributesOfFileSystem(forPath: "ddd")
}

do {
    try functionName()
}catch {
    print(error)
}

let external: (() -> Void) -> Void = {_ in ()}
func takesTwoFunctions(first: (() -> Void) -> Void, second: (() -> Void) -> Void) {
//    first { first {} } // Error
//    second { second{} } // Error
//    first { second{} } // Error
//    second { first{} } // Error
    first { external{ }}
    external{ first{ }}
}


var optionalInterger:Optional<Int>
let possibleString: String? = "An optianal string."
let forcedString: String = possibleString! // requred a exclamation mark

let assumedString: String! = "An implicitly unwaped optional string"
let implictitString: String = assumedString // no need for exclamation mark

if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicitly unwrapped optional string"

if let definitedString = assumedString {
    print(definitedString)
}

