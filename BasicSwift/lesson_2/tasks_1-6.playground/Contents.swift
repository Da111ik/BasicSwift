import UIKit

// task 1 and 2
// function check remainder of division

func checkNumber(num: Int, div: Int = 2) -> Bool{
    return num.isMultiple(of: div)
}

//--------------------------------------------------

// task 3
// increasing array

var array: Array<Int> = []
for i in 1...100 {
    array.append(i)
}

//--------------------------------------------------

// task 4
// remove elemets from array
for index in stride(from: array.count-1, through: 0, by: -1) {
    
    if checkNumber(num: array[index], div: 2) || !checkNumber(num: array[index], div: 3) {
        array.remove(at: index)
    }
}


//--------------------------------------------------

// task 5
// Fibonacci aequence
var seqFibinacci: [Double] = [0,1]
for i in 2..<100 {
    seqFibinacci.append(seqFibinacci[i - 2] + seqFibinacci[i - 1])
}


//--------------------------------------------------

// task 6
// simple numder
func numberIsSimple(num: Int) -> Bool{

    for i in 2..<num {
        
        if checkNumber(num: num, div: i) {
            return false
        }
    }
    return true
}


var arraySimple: [Int] = [1]

for i in 2...100 {
    
    if numberIsSimple(num: i) {
        
        arraySimple.append(i)
    }
}

