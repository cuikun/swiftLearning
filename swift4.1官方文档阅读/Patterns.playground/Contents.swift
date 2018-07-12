import UIKit

var point = (3,2)
switch point {
case let (x, y):
    print("The point is at (\(x), \(y))")
}

let points = [(0, 0), (1, 1), (2, 0), (2, 1)]
for (x, _) in points {
    
}
points

//let a = 2
//let (a) = 2
//let (a): Int = 2

enum Patterns {
    case one
    case two
    case three
    case four
}

let oneP:Patterns = Patterns.one

if case .one = oneP {
    print("aa")
}

func function() {
    guard case .one = oneP else {
        print("aaaaa")
        return
    }
}
function()

// enumeration case pattern
let someOptional: Int? = 42
if case .some(let x) = someOptional {
    print(x)
}

// optional patterns
if case let x? = someOptional {
    print(x)
}

// optional binding
if let x = someOptional {
    print(x)
}

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}

struct Movie {
    var name = ""
    var director = ""
}

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "ghost", director: "ivan"))
things.append({(name: String) -> String in "Hello, \(name)"})

for thing in things {
    switch thing  {
    case 0 as Int:
        print("zero")
    case 0 as Double:
        print("zero double")
    case let someInt as Int:
        print("Interger \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("Double \(someDouble)")
    case is Double:
        print("some other double")
    case let someString as String:
        print("someString \(someString)")
    case let (x, y) as (Double, Double):
        print("an (x, y) point is \(x), \(y)")
    case let movie as Movie:
        print("an movie called \(movie.name)")
    case let stringConverter as (String) -> String :
        print(stringConverter("arrayOfOptionalInts"))
    default:
        print("some else")
    }
}

point = (1, 2)
switch point {
case (0, 0):
    print("orgin")
case (-2...2, -2...2):
    print("\(point.0)\(point.1) is near the origin")
default:
    print("\(point.0)\(point.1)")
}

if -2...2 ~= point.0 {
    print("x is ")
}

func ~= (pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}

point = (0, 0)

switch point {
case ("0", "0"):
    print("origin")
default:
    print("default")
}

