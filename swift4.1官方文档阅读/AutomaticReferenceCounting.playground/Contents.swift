//import UIKit
//
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
////        print("\(name) is being initialized")
//    }
//    var apartment: Apartment?
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
////var reference1: Person?
////var reference2: Person?
////var reference3: Person?
//
////reference1 = Person(name: "John appleseed")
////reference2 = reference1
////reference3 = reference1
////
////reference1 = nil
////reference2 = nil
////reference3 = nil
//
//class Apartment {
//    let unit:String
//    init(uint: String) {
//        self.unit = uint
////        print("Apartment \(unit) is being initialized")
//    }
//    weak var tennat: Person?
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(uint: "4A")
//
//john!.apartment = unit4A
//unit4A!.tennat = john
//
//john = nil
//unit4A = nil
//

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john //这个地方改成？就行了，用！不能释放，好奇怪

john = nil
unit4A = nil


class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var johnson: Customer?
johnson = Customer(name: "John Appleaseed")
johnson!.card = CreditCard(number: 1234_5678_0123_4567, customer: johnson!)
johnson = nil

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit {
        print("Country \(name) is deinitialized")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City \(name) is deinitialized")
    }
}

var country: Country? = Country(name: "Canada", capitalName: "Ottawa")
print("\(country!.name)'s capital city is called \(country!.capitalCity.name)")

country = nil

class HTMLElement {
    let name: String
    var text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello word")
print(paragraph!.asHTML())

paragraph = nil

//lazy var someClosure: (Int, String) -> String = {
//    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
//    // closure body goes here
//}

//lazy var someClosure:() -> String  = {
//    [unowned self, weak delegate = self.delegate!] in
//    // closure body goes here
//}


class HTMLElement1 {
    let name: String
    let text:String?
    lazy var asHTML:() -> String = {[unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph1: HTMLElement1? = HTMLElement1(name: "p", text: "hello, world")
print(paragraph1!.asHTML())

paragraph1 = nil

