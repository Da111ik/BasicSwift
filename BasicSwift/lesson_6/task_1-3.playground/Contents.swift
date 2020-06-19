import UIKit


struct Stack<T>{
    
    private var array: [T] = []

    subscript (index: Int) -> T? {
        get {
          
            guard self.array.count > index else {return nil}
            return self.array[index]
        }
        
        set {
            guard let value = newValue else { return }
            guard self.array.count > index else {return}
            self.array[index] = value
        }
    }
    
    mutating func push(newElement: T) {
        self.array.append(newElement)
    }
    
    mutating func pop() -> T? {
        
        guard array.count > 0 else {return nil}
        return array.removeFirst()
        
    }

    
    func filter(evenIndex: (Int)->(Bool)) -> [T] {
        
        var result: [T] = []
        
        for (index, value) in self.array.enumerated() {
            if evenIndex(index) {
               result.append(value)
            }
        }
  
        return result
        
    }
    
}

var stack = Stack<Int>()
stack.pop()
stack.push(newElement: 0)
stack.push(newElement: 1)
stack.push(newElement: 2)
stack.push(newElement: 3)
stack.push(newElement: 4)
stack.push(newElement: 5)
stack.push(newElement: 6)
stack.push(newElement: 7)
stack.push(newElement: 8)
stack.push(newElement: 9)

stack.pop()
stack[0]
stack[1]
stack[2]

var array = stack.filter(evenIndex: {$0 % 2 > 0 })
array
