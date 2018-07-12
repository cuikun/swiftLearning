import UIKit

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
print(String(invertedBits, radix: 2, uppercase: false))

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleForBits = firstSixBits & lastSixBits
print(String(middleForBits, radix: 2, uppercase: false))


let firstBits: UInt8 = 0b00010100
let oterBits: UInt8 = 0b00000101
let outputBits = firstBits ^ oterBits
print(String(outputBits,radix: 2, uppercase: false))

extension UInt8 {
    func printRaix2(){
        print(String(self,radix: 2, uppercase: false))
    }
}

print("shiftBits")

let shiftBits: UInt8 = 4
shiftBits.printRaix2()
(shiftBits << 1).printRaix2()
(shiftBits << 2).printRaix2()
(shiftBits << 5).printRaix2()
(shiftBits << 6).printRaix2()
(shiftBits >> 2).printRaix2()

let pink = 0xCC6699
let redComment = (pink & 0xFF0000) >> 16 // redComment is 0xCC, or 204
let greenComment = (pink & 0x00FF00) >> 8 // greenComment is 0x66 or 102
let blueComment = pink & 0x0000FF // blueComment is 0x99, or 153

var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
//potentialOverflow += 1 // error
// this causes an error


var unsignedOverflow = UInt8.max
// unsignedOverflow equal 255, which is the maximum value Uint8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsigendOVerflow is zero

unsignedOverflow = UInt8.min
unsignedOverflow &- 1
// unsignedOverflow is 255

var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1

signedOverflow = Int8.max
signedOverflow &+ 1

2 + 3 % 4 * 5

2 + ((3 % 4) * 5)

2 + 3 * 5

2 + 15

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combineVctor = vector + anotherVector
(combineVctor.x, combineVctor.y)

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
let negtiveVector = -vector
(negtiveVector.x, negtiveVector.y)

extension Vector2D {
    static postfix func ++ (vector: Vector2D) -> Vector2D {
        return Vector2D(x: vector.x + 1, y: vector.y + 1)
    }
}


let plusVector = vector++
(plusVector.x, plusVector.y)

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var vector1 = vector
vector1 += Vector2D(x: 0, y: 2)
(vector1.x, vector1.y)

extension Vector2D {
    static func - (ll: Vector2D, rr: Vector2D) -> Vector2D {
        return Vector2D(x:-rr.x, y:-rr.y)
    }
}

let test = Vector2D(x: 2, y: 2) - Vector2D(x: 1, y: 1)
(test.x, test.y)

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let antherTwoThree = Vector2D(x: 2.0, y: 3.0)

if twoThree != antherTwoThree {
    print("these two vectors are not equivalent")
} else {
    print("these two vectors are equivalent")
}


struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2, y: 3, z: 4)
let anotherTwoThreeFour = Vector3D(x: 2, y: 3, z: 4)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent")
}

enum Director: Equatable {
    case north,sourth,west,east
}
let north = Director.north
let antherNorth = Director.north

north == antherNorth

enum Sex:Equatable{
    case male
    case feMale
    case ohter(String)
}

let male = Sex.male
let other = Sex.ohter("transFemal")
let another = Sex.ohter("transFemal")
male == other
other == another

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1, y: 4)
let afterDoubing = +++toBeDoubled
(afterDoubing.x, afterDoubing.y)

infix operator +-: myPrecedence
precedencegroup myPrecedence {
    higherThan: AdditionPrecedence
    lowerThan: MultiplicationPrecedence
    assignment:false
    associativity: left
}

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector:Vector2D? = Vector2D(x: 1, y: 2)
let secondVector =  Vector2D(x: 3, y: 4)
let plusMinus = firstVector! +- secondVector

extension Vector2D {
    var description: (Double, Double) {
        return (self.x, self.y)
    }
}


plusMinus.description


