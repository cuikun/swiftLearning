//: Playground - noun: a place where people can play

import UIKit
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct AlternativeRect {
    var orgin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = orgin.x + (size.width / 2)
            let centerY = orgin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            orgin.x = newValue.x - (size.width / 2)
            orgin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = AlternativeRect(orgin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
let initialSquareCenter = square.center
square.center = Point(x: 15, y: 15)
print("square.origin is now at (\(square.orgin.x), \(square.orgin.y)")

class StepCounter {
    var totalSteps:Int = 0 {
        willSet(newTotalSteps) {
            print("About to set total steps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 350
stepCounter.totalSteps = 896


struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overridealbeComputedTypeproperty:Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
// print some value
SomeStructure.storedTypeProperty = "another value"
// prints another value
print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevlForAllChannels = 0
    var currentLevel:Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the thresholdLevel
                currentLevel = AudioChannel
            }
            if currentLevel > AudioChannel.maxInputLevlForAllChannels {
                // store this as the new maxinum input level
                AudioChannel.maxInputLevlForAllChannels = currentLevel
            }
        }
    }
}

var  leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevlForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevlForAllChannels)

