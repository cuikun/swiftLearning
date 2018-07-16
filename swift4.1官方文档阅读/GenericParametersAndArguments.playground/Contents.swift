import UIKit

func simpleMax<T: Comparable>(_ x: T, _ y: T) -> T {
    if x < y {
        return y
    }
    return x
}

var possibleInteger:Optional<Int> = .none
possibleInteger = 1
possibleInteger = .some(30)
possibleInteger = nil

var possInteger: Int? = .none
possInteger = .some(20)


let age = -3
//assert(age > 0, "A person's age cannot be less than zero")

if age > 10 {
    print("you can ride roller-coster or ferris wheel")
} else if age > 0{
    print("you can ride ferris wheel")
} else {
//    assertionFailure("A persion's age cannot be less than zero")
}

//precondition(age > 0, "age must be greater than zero")

