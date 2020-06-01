import UIKit

// quadratic
var a: Double = 2
var b: Double = 6
var c: Double = 4

let D = Double(b * b - 4 * a * c)

if D > 0 {
    let x1 = (-b + D.squareRoot()) / 2 * a
    let x2 = (-b - D.squareRoot()) / 2 * a
    print("quadratic have decisions: \(x1) \(x2)")
}
else if D == 0 {
    let x = -b / 2 * a
    print("quadrtic have decision: \(x)")
}
else{
    print("quasratic dont have decision")
}

