//: Playground - noun: a place where people can play

import UIKit

// Early Exit

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
greet(person: ["name" : "Jane", "location": "Cupertino"])


// 用于 guard 退出的关键字 return 、break ，continue， throw ，fatalError

if #available(iOS 10, macOS 10.12, *) {
// use iOS 10 apis on iOS ,and use macOS 10.12 APIs on macOS
} else {
// Fall back to earlier iOS and macOS APIs
}

// 参数都有 iOS macOS watchOS tvOS

var a:Int? = 3

if true, let b = a, b == 3 {
    print("true")
} else {
    print("false")
}



