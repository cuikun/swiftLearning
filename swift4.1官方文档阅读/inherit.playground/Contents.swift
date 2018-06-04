//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do noting - an arbitrary vehicle doesn't necessarily make a noise
    }
}
let someVehicle = Vehicle()

print("Vehicle: \(someVehicle.description)")

class Bicyle: Vehicle {
    var hasBasket = false
}

let bicyle = Bicyle()
bicyle.hasBasket = true
bicyle.currentSpeed = 15.0
print("Bicyle: \(bicyle.description)")

class Tandem: Bicyle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("tandem: \(tandem.description)")


class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}


class AutomaticCar: Car {
    
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35
print("AutomaticCar: \(automatic.description)")




