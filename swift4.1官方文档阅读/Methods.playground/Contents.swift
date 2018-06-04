//: Playground - noun: a place where people can play

import UIKit

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    func isToRightOf(x: Double) -> Bool {
        return self.x > x
    }
    
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToRightOf(x: 1) {
    print("this point is to hte right of the line where x == 1.0")
}
// prints "this point is to the right of the line where x == 1.0"

struct TPoint {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var thisPoint = TPoint(x: 1, y: 1)
thisPoint.moveBy(x: 2, y: 3)

// let 修饰的数值类型的实例， 属性也都是不可变的，即使用var修饰的属性

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var current = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level}
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        if level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            current = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName = String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("hightest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
