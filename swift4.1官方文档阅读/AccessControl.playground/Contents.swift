import UIKit

public class SomePublicClass { }
internal class SomeInternalClass { }
fileprivate class SomeFilePrivateClass { }

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() { }
private func somePrivateFunction() { }


class SomeInternalClass1{ } // some internal class
let someiNternalConstant = 0 // some internal consant

4.5.description
"\(4.5)"

class codealbe: Codable {
    
}

public class SomePublicClass1 { // explictly public class
    public var somePublicPropery = 0 // explictly public class
    var someInternalProperty = 0 // implicitly internal
    fileprivate func someFilePrivateMethod() { } // exteplicitly filepriva
    private func somePrivateMethod(){ } // explicitly private
    
}

class SomeInternalClass2 { //implicitly internal class
    var someInternamProperty = 0 // implicitly internal class member
    fileprivate func someFilePrivateMethod() { } // explicity fileprivate class member
    private func somePrivateMethod() { } // explicitly private member
}

fileprivate class SomeFilePrivateClass1 { // explicity file-private class
    func somefilePrivateMethod() { } // implictly private class member
    private func somePrivateMethod() { } // explictly private class member
}

private class somePrivateClass { // explicitly private class
    func somePrivateMethod() { } // implicitly private class member
}

private func someFunction() -> (SomeInternalClass, somePrivateClass) {
    // function implementation goes here
    return (SomeInternalClass(), somePrivateClass())
}

public enum CompassPoint {
    case north
    case south
    case east
    case west
}

public class A {
    fileprivate func someMethod() { }
}

internal class B:A {
    override internal func someMethod() {
        super.someMethod()
    }
}

private var privateInstance = somePrivateClass()

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += "This edit will increment numberOfEdits."
stringToEdit.value += "So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString1 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() { }
}

public class RequiredClass {
    internal required init() {
    }
}

struct People {
    private var name: String
    var height: String
}


fileprivate protocol someProtocol {
    func someProtocolFunc()
    var someProtocolVariable: String? { get }
}

fileprivate protocol someSubProtocol: someProtocol {
    func someSubProcotolFunc()
    var someSubProcotolVariable: String? { get }
}


extension People: someProtocol {
    func someProtocolFunc() {

    }
    
    var someProtocolVariable: String? {
        return ""
    }
}

extension someProtocol {
    private func someProtocolFunc() {

    }
}

struct SomeStruct {
    private var  privatevar = 12
}

extension SomeStruct: someProtocol {
    func someProtocolFunc() {
        print(self.privatevar.description)
    }
    
    var someProtocolVariable: String? {
        return self.privatevar.description
    }
    
    private func someStructFunc() {
        print("some struct func")
    }

}

extension SomeStruct {
    fileprivate typealias item = SomePublicClass
    func anotherStructFunc() {
        self.someStructFunc()
    }
}


fileprivate class someGenerics<T> where T: Equatable {
    private var type:T?
    func get(type: T) {
    }
    
    func someFunc<U>(unit: U) {
        
    }
}


fileprivate protocol PR {}

private func foo<T: PR>(_ arg: T) {} // foo 的 level of Access control is less than protocol PR


protocol P {}
class C {}
class D : C { }
class E : C { }
class F : D, P { }

let t:  D & P = F() // Okay: F is a subclass of D and conforms to P
// error: protocol-constrained type cannot contain class 'D' because it already contains class 'C'

let u: D & P = t       // Okay: D & P is equivalent to C & D & P
// error: value of type 'C & P' does not conform to specified type 'D & P'

let v: D & P = u   // Okay: C & D & P is equivalent to D & P
// error: protocol-constrained type cannot contain class 'D' because it already contains class 'C

// typealias  less than the type
//


