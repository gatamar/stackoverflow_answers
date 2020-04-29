import UIKit
import SceneKit

struct A {
    var m : Int = 0
}

var arr: [A] = [A(m: 1), A(m: 2), A(m: 3)]
arr = arr.map({ $0.m > 42 ? $0 : A(m: 42) })
arr

