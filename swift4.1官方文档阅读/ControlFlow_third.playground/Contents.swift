//: Playground - noun: a place where people can play

import UIKit

// labeled Statements

// 作用于所有循环和switch， break ，continue 与之结合使用

let finalSquare = 25
var board = [Int](repeating:0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    switch square + diceRoll {
    case finalSquare:
        //diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        //diceRoll will move us beyond the fianl square, so roll again
        continue gameLoop // 不是必须使用gameLoop标签，和break gameLoop 一起使用更加清晰易读
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("game over")



