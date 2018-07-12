import UIKit

func localFunc() {
    
    var storyVar: String = "aaa" {
        willSet {
            print(newValue)
        }
        didSet {
            print(oldValue)
        }
    }
    
    var variable: String {
        get {
            return storyVar + "bbb"
        }
        set {
             storyVar = newValue
        }
    }
    
    print(variable)
    variable = "333"
    print(variable)
}

localFunc()


typealias StringDictionary<Value> = Dictionary<String, Value>

// the following dictory have the same type
var dictionary: StringDictionary<Int> = [:]
var dictionary1: Dictionary<String, Int> = [:]

typealias DictionaryOfInt<Key: Hashable> = Dictionary<Key, Int>

protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    typealias Element = Iterator.Element
}

func sum<T: Sequence>(_ sequence: T) -> Int where T.Element == Int {
    return 10
}

func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1 }
}

func multithreadedFunction(queue: DispatchQueue, x: inout Int ) {
    var localx = x
    defer {
        x = localx
    }
    
    // operate on local asnchronously, then wait before returning
    queue.async {
        someMutatingOperation(param: &localx)
    }
    queue.sync {}
}

func someMutatingOperation( param: inout Int) {
    param = param * 2
}

var someParam = 10
multithreadedFunction(queue: DispatchQueue.global(), x: &someParam)
print(someParam)


func f(x: Int = 42) -> Int { return x }
f()
f(x: 7)
//f(7)

func neverfunc() -> Never {
    fatalError()
}
struct St {
    var title = ""
    var name = ""
}

enum eeee {
    case St(title:String, name: String)
    
    init?(title:String, name: String){
        if !title.isEmpty && !name.isEmpty {
            self = .St(title:title, name:name)
        }
        return nil
    }
}

let s = eeee.St(title: "33", name: "33")

switch s {
case eeee.St(let title, let name):
    print(title,name)
}

typealias Config = (RAM: Int, CPU: String, GPU: String)

func selectRAM(_ config: Config) -> Config { return (RAM: 32, CPU: config.CPU, GPU: config.GPU) }
func selectCPU(_ config: Config) -> Config { return (RAM: config.RAM, CPU: "3.2GHZ", GPU: config.GPU) }
func selectGPU(_ config: Config) -> Config { return (RAM: config.RAM, CPU: config.CPU, GPU: "NVidia") }

enum Desktop {
    case Cube(Config)
    case Tower(Config)
    case Rack(Config)
}

let aTower = Desktop.Tower(selectRAM((0,"","")))

infix operator <^> : MyPrecedenceGroup

precedencegroup MyPrecedenceGroup {
    associativity : left
}

func <^>(a: Config, f:(Config) -> Config) -> Config {
    return f(a)
}

let config = (0, "", "") <^> selectRAM <^> selectCPU <^> selectGPU


enum Number {
    case integer(Int)
    case real(Double)
}

let f = Number.integer

let eventInts: [Number] = [0, 2, 4, 6].map(f)

enum Tree<T> {
    case empty
    indirect case node(value: T, left: Tree, right: Tree )
}

indirect enum Temp {
    case empty
    case node(value: String, title: String)
}

enum ExampleEnum: Int {
    case a,b,c = 5,d
}

let ea = ExampleEnum.a.rawValue
let ec = ExampleEnum.c.rawValue
let ed = ExampleEnum.d.rawValue

protocol staticParamProto {
    static var name: String { get }
    static func text()
}

class staClass: staticParamProto {
    static var name: String = ""
    static func text() {
        print("haha")
    }
}

class staClass1: staticParamProto {
    class var name: String {
        get {
            return "haha"
        }
    }
    class func text() {
        print("haha")
    }
}

protocol SomeProtocol {
    associatedtype SomeType
}

//protocol Subprotocol: SomeProtocol {
//    associatedtype SomeType: Equatable
//}

protocol Subprotocol: SomeProtocol where SomeType: Equatable {
    
}

protocol Loggable {
    func log()
}

extension Loggable {
    func log() {
        print(self)
    }
}

protocol TitledLoggable: Loggable {
    static var logTitle: String { get }
}

extension TitledLoggable {
    func log() {
        print("\(Self.logTitle): \(self)")
    }
}

struct Pair<T>: CustomStringConvertible {
    
    let first: T
    let second: T
    
    var description: String {
        return "\(first), \(second)"
    }
    
}

extension Pair : Loggable where T: Loggable {
    
}

extension Pair: TitledLoggable where T: TitledLoggable {
    static var logTitle: String {
        return "Pair of '\(T.logTitle)'"
    }
}

extension String: TitledLoggable {
    static var logTitle: String {
        return "String"
    }
}

let oneAndTwo = Pair(first: "One", second: "Two")
oneAndTwo.log()

func doSomething<T: Loggable>(with x: T) {
    x.log()
}
doSomething(with: oneAndTwo)

protocol Serializable {
    func serialize() -> Any
}

//extension Array: Serializable where Element == Int {
//    func serialize() -> Any {
//        //
//        return 1
//    }
//}
//
//extension Array: Serializable where Element == String {
//    func serialize() -> Any {
//        return 1
//    }
//}

protocol SerializableInArray { }
extension Int: SerializableInArray { }
extension String: SerializableInArray { }

//extension Array: Serializable where Element: SerializableInArray {
//    func serialize() -> Any {
//        return 1
//    }
//}

protocol MarkedLoggable: Loggable {
    func markAndLog()
}

extension MarkedLoggable {
    func markAndLog() {
        print("-------------")
        log()
    }
}

extension Array: Serializable where Element: SerializableInArray {
    func serialize() -> Any {
        // implementation
        return 1
    }
}

