import UIKit

//  right triangle

var a: Double = 13
var b: Double = 16

// area triangle
let S = 1 / 2 * a * b

// hypotenuse
let c = (a * a + b * b).squareRoot()

// perimeter
let P = a + b + c

print("area: \(S) \nhypotenuse: \(c) \nperimeter: \(P)")
