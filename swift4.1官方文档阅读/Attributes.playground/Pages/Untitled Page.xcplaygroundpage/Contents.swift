import UIKit

@available(swift 3.2)
@available(iOS 11, macOS 9, *)
class a { }

@available(*, unavailable, renamed: "MyRenameProtocol")
protocol MyProtocol {
    
}
protocol MyRenameProtocol {
    
}

// Error: 'MyProtocol' has been renamed to 'MyRenameProtocol'
//extension a: MyProtocol {
//}

@dynamicMemberLookup
struct DyamicStruct {
    let dictionary = ["someDynamicMember": 325,
                      "someOtherMember": 787]
    subscript(dynamicMember member: String) -> Int {
        return dictionary[member] ?? 1024
    }
}
let s = DyamicStruct()
let dynamic = s.someDynamicMember

let equivalent = s[dynamicMember: "someDynamicMember"]
dynamic == equivalent

@inlinable func aa() {
    print("aa")
}

class Copy:NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        // how to implement
        return "ddd"
    }
}

class Body {
    @NSCopying var name: Copy = Copy()
}

let c = Body()
print(c.name)

class ExampleClass: NSObject {
    @objc var enabled: Bool {
        @objc(isEnabled) get {
            return false
        }
    }
}

@objcMembers class ExamClass {
    @objc var enabled: Bool {
        @objc(isEnabled) get {
            return false
        }
    }
}

//@testable import PhotosUI
//@UIApplicationMain




