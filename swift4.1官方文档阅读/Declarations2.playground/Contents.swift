import UIKit

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

protocol MarkLoggable: Loggable {
    func markAndLog()
}

extension MarkLoggable {
    func markAndLog() {
        print("----------")
        log()
    }
}

extension Array: Loggable where Element: Loggable { }
extension Array: TitledLoggable where Element: TitledLoggable {
    static var logTitle: String {
        return "Array of '\(Element.logTitle)'"
    }
}

extension Array: MarkLoggable where Element: MarkLoggable { }

class DeclarationClassDynamic {
    @objc dynamic var name: String = ""
}

