import UIKit

// deposit sum

var sum: Double = 1000
var per: Double = 7.5

var totalSum = sum * (1 + per / 100)

totalSum = totalSum * (1 + per / 100)
totalSum = totalSum * (1 + per / 100)
totalSum = totalSum * (1 + per / 100)
totalSum = totalSum * (1 + per / 100)

print("Your sum deposit after 5 years: \(totalSum)")
