//: Playground - noun: a place where people can play

import UIKit

//Swift的switch语句比许多C语言中的对应语言强大得多。 case可以匹配许多不同的模式，包括区间匹配，元组和特定类型的强制转换。 Switch每个case的值可以绑定到临时常量或变量，以便在case的主体中使用，并且复杂的匹配条件可以用每个case的where子句表示。

// For-in loops

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello,\(name)!")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legcount) in numberOfLegs {
    print("\(animalName)s have \(legcount) legs")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

let minutes = 60

for tickMark in 0..<minutes {
//    rendr the tick mark each minute (60 times)
}

let minuteInterval = 5

for tickMark in stride(from: 9, to: minutes, by: minutes) {
//    render the tick mark every 5 minutes (0, 5,10,15...55)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, to: hours, by: hourInterval) {
//     render the mark every 3 hour (3,6,9,12)
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;

var square = 0
var diceRoll = 0

while square < finalSquare {
//    roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
//    move by the rolled amount
    square += diceRoll
    if square < board.count {
//        if we'are still on the board move up or down for snake or ladder
        square += board[square]
    }
}
print("Game over!")

square = 0
repeat {
//    move up or down for a snake or ladder
    square += board[square]
//    roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    square += diceRoll
}while square < finalSquare

print("Game over")


//Swift提供了两种方法将条件分支添加到代码中：if语句和switch语句。 通常情况下，您使用if语句来评估简单条件，只有几个可能的结果。 switch语句更适合于具有多种可能排列的更复杂的条件，并且在模式匹配可以帮助选择适当的代码分支来执行的情况下非常有用。

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scaf")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scanf")
} else {
    print("It's not that cold. Wear a t-shirt")
}

// Prints "It's not that cold. Wear a t-shirt."

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32 {
    print("It's very cold.Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}


//Switch


//switch语句会考虑一个值并将其与几种可能的匹配模式进行比较。 然后根据成功匹配的第一个模式执行适当的代码块。 switch语句为if语句提供了用于响应多个潜在状态的替代方法。

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"








