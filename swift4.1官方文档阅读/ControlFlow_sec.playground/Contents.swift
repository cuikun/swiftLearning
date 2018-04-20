//: Playground - noun: a place where people can play


let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside the box")
}

// value binding

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with a x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("\(x), \(y) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitray point")
}

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
         "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consoant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("on an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}


// continue

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)


let numberSymbol: Character = "三"
var possibleInterValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleInterValue = 1
case "2", "٢", "二", "๒":
    possibleInterValue = 2
case "3", "٣", "三", "๓":
    possibleInterValue = 3
case "4", "٤", "四", "๔":
    possibleInterValue = 4
default:
    break
}
if let integerValue = possibleInterValue {
    print("The integer value of \(numberSymbol) is \(integerValue)")
} else {
    print("An integer value could not be found for \(numberSymbol)")
}

// fallthrough 仅仅是为了模拟c中的switch，自动过渡到下个case或者default

let interToDescribe = 5
var description = "The number \(interToDescribe) is"
switch interToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also"
    fallthrough
default:
    description += "an integer."
}
print(description)



