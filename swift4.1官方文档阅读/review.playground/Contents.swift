import UIKit

struct FixedLengthRange {
    var firstValue: Int = 0
    let length: Int = 0
}

let x = FixedLengthRange()

enum Director {
    case east
    case west
    case north
    case sourth
}

class Item {
    var name: String = ""
    var value: String = ""
}


enum Cg: CGFloat {
    case a
    case b
    case c
}

Cg.a.rawValue
Cg.b.rawValue
Cg.c.rawValue

enum Trade {
    case Buy(stock: String, amount: Int)
    case Sell(stock: String, amount: Int)
}
func trade(type: Trade){ }

let trade = Trade.Buy(stock: "APPL", amount: 500)

if case let Trade.Buy(stock, amount) = trade {
    print("buy \(amount) of \(stock)")
}

let trade1 = Trade.Sell(stock: "TSLA", amount: 100)
if case let Trade.Sell(stock, amount) = trade1 {
    print("sell \(amount) of \(stock)")
}

enum UserAction {
    case OpenURL(url: NSURL)
    case SwitchProcess(processId: UInt32)
    case Restart(time: NSDate?, intoCommandLine: Bool)
}

enum Selection {
    case None
    case Single(Range<Int>)
    case Mutiple([Range<Int>])
}

enum BarCode {
    case UPCA(numberSystem: Int, manufaturer: Int, product: Int, check: Int)
    case QRCode(productCode: String)
}
 
enum KqueueEvent {
    case UserEvent(identifier: UInt, fflags: [UInt32], data: Int)
    case ReadFD(fd:UInt, data: Int)
    case VnodeFD(fd: UInt, fflags: [UInt32], data: Int)
    case ErrorEvent(code: UInt, message: String)
}

enum Wearable {
    enum Weight: Int {
        case Light = 1
        case Mid = 4
        case Heavy = 10
    }
    enum Armor: Int {
        case Light = 2
        case Strong = 8
        case Heavy = 20
    }
    case Helmet(weight:Weight, armor: Armor)
//    case Breastplate(weight: Weight, armor: Armor)
//    case Shield(weight: Weight, armor: Armor)
    
    func attributes() -> (weight: Int, armor: Int) {
        switch self {
            case .Helmet(weight: let a, armor: let b):
                return (a.rawValue,b.rawValue)
        }
    }
}

let woodenHelmet = Wearable.Helmet(weight: .Light, armor: .Light).attributes()

protocol CustomStringConvertible {
    var descripiton: String { get }
}

enum Tradee: CustomStringConvertible {
    case Buy, Sell
    var descripiton: String {
        switch self {
        case .Buy:
            return "We're buying something"
        case .Sell:
            return "We're selling something"
        }
    }
}
let action = Tradee.Buy
print("this action is \(action)")


protocol AccountCompatible {
    var remainingFunds: Int { get }
    mutating func addFunds(amount: Int) throws
    mutating func removeFunds(amount: Int) throws
}

enum Account {
    case Empty
    case Funds(remaining: Int)
    
    enum Err: Error {
        case Overdraft(amount: Int)
    }
    
    var remainingFunds: Int {
        switch self {
        case .Empty:
            return 0
        case .Funds(remaining: let remaining):
            return remaining
        }
    }
}

extension Account: AccountCompatible {
    mutating func addFunds(amount: Int) throws {
        var newAmount = amount
        if case let .Funds(remaining) = self {
            newAmount += remaining
        }
        if newAmount < 0 {
            throw Err.Overdraft(amount: -newAmount)
        }else if newAmount == 0 {
            self = .Empty
        }else {
            self = .Funds(remaining: newAmount)
        }
    }
    
    mutating func removeFunds(amount: Int) throws {
        try self.addFunds(amount: -amount)
    }
    
}

var account = Account.Funds(remaining: 20)
print("add:", try? account.addFunds(amount: 10))
print("remove 1:", try? account.removeFunds(amount: 15))
print("remove 2:", try? account.removeFunds(amount: 55))

enum Tntities {
    case Soldier(x: Int, y: Int)
    case Tank(x: Int, y: Int)
    case Player(x: Int, y: Int)
}

extension CGSize: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
        self.init(width: size.width, height: size.height)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
        self.init(width: size.width, height: size.height)
    }
    
    public init(unicodeScalarLiteral value: String) {
        let size = NSCoder.cgSize(for: value)
        self.init(width: size.width, height: size.height)
    }
}


enum Devices: CGSize {
    case iPhone3GS = "{320, 480}"
    case iPhone5 = "{320, 568}"
    case iPhone6 = "{375, 667}"
    case iPhone6Plus = "{414, 736}"
}

let a = Devices.iPhone5.rawValue


extension Trade: Equatable {
    static func == (lhs:Trade, rhs: Trade) -> Bool {
        switch (lhs, rhs) {
        case let (.Buy(stock1, amount1),.Buy(stock2, amount2)) where stock1 == stock2 && amount1 == amount2:
            return true
        case let (.Sell(stock1, amount1),.Sell(stock2, amount2)) where stock1 == stock2 && amount1 == amount2:
            return true
        default:
            return false
        }
    }
}

