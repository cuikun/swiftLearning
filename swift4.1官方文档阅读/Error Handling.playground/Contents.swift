import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Prezels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoritesSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnak(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoritesSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchaseSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try  buyFavoriteSnak(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins")
} catch {
    print("Unexpected error: \(error)")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    }catch is VendingMachineError {
        print("Invalid selectoin, out of stock, or not enough meney")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error:\(error)")
}
// Prints "Invalid selection, out of stock, or not enough money

func someThrowingFunction() throws -> Int {
    // ...
//    throw VendingMachineError.invalidSelection
    return 1
}


let x = try? someThrowingFunction()

var y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

func fetchDataFromDisk() throws -> Data {
//    throw VendingMachineError.outOfStock
    return Data()
}

func  fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromDisk() { return data }
    return nil
}

//func processFile(filename: String) throws {
//
////    if exists(filename) {
////        let file = open(filename)
//        defer {
////            close(file)
//        }
////        while let line = try file.readline {
//            // work with the file
//        }
////    }
//}
