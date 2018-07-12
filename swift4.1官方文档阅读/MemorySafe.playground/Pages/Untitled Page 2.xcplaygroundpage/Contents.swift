import Foundation

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)
oscar.health
maria.health

//oscar.shareHealth(with: &oscar) // compile error

var playerInformation = (health: 8, energy: 10)
balance(&playerInformation.health, &playerInformation.energy)
playerInformation


var holly = Player(name: "holly", health: 15, energy: 10)
balance(&holly.health, &holly.energy)
holly.energy
holly.health

var params = [String: Any]()
var param: [String: Any] = [:]()
