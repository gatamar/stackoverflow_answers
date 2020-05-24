import UIKit

protocol SomeProtocol {
    associatedtype SomeType: Encodable
}

class SomeInner: SomeProtocol {
    typealias SomeType = String
}

class SomeInner2: SomeProtocol {
    typealias SomeType = URL
}

class AnotherClass<Inner: SomeProtocol> {
    func someFunc() {
        if Inner.SomeType.self is String.Type { // << warning
            print("it's a String")
        }
        if Inner.SomeType.self is URL.Type { // << warning
            print("it's an URL")
        }
    }
}

let test1 = AnotherClass<SomeInner>()
test1.someFunc()

let test2 = AnotherClass<SomeInner2>()
test2.someFunc()
