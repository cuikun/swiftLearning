//: Playground - noun: a place where people can play

import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1, s2) -> Bool in return s1 > s2 })

reversedNames = names.sorted(by: { (s1, s2) -> Bool in  s1 > s2 })

reversedNames = names.sorted(by: { (s1, s2) in  s1 > s2 })

reversedNames = names.sorted(by: { $0 > $1 })

reversedNames = names.sorted(){ $0 > $1 }

reversedNames = names.sorted{ $0 > $1 }

reversedNames = names.sorted(by: > )


func someFuncThatTakesAClosures(closure: () -> Void) {
    // func body goes here
}
someFuncThatTakesAClosures(closure: {
    
})
someFuncThatTakesAClosures() {
    
}
someFuncThatTakesAClosures {
    
}

var ret:Double = 50
let margin:Int = 60
for index in 1...margin {
    ret  += (1 - atan(1/Double(margin)*Double(index)) / Double.pi * 4) * 2
    print(ret)
}

Double.pi/4

Date(timeIntervalSince1970: TimeInterval(Int32.max))

Double(Int32.max)/100/60/60/24



