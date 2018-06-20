//: Playground - noun: a place where people can play

import UIKit

class Person1 {
    var resindence: Residence1?
}

class Residence1 {
    var numberOfRooms = 1
}

let john1 = Person1()
let roomCount = john1.resindence

if let roomCount = john1.resindence?.numberOfRooms {
    print("john's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms")
}


class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIndentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber)\(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    john.residence?.address = someAddress
    
    return someAddress
}

john.residence?.address = createAddress()


if john.residence?.printNumberOfRooms() != nil {
    print("It was posslbke to print the number of rooms")
} else {
    print("It was not possible to print the number of rooms")
}

if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
} else {
    print("It was not possible to set the address")
}

if let firstRoomName = john.residence?[0].name {
    print("THe first room is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

if (john.residence?[0] = Room(name: "Batnroom")) != nil {
    print("It was possilbe to set the first room")
} else {
    print("Unable to set first room")
}




let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("THe first room is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72


if let johnsStreet = john.residence?.address?.street {
    print("Johs's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address")
}


let johnsAddrss = Address()
johnsAddrss.buildingName = "The Larches"
johnsAddrss.street = "Laurel Street"
john.residence?.address = johnsAddrss

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}

if let buildingIdentifier = john.residence?.address?.buildingIndentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}

if let beginsWithThe = john.residence?.address?.buildingIndentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\"")
    } else {
        print("John's building identifier does not begin with \"The\"")
    }
    
    
}
