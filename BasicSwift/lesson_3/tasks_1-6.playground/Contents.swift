
enum Brand {
    case bmw, toyota, reno, lexus
}

enum ConditionCar {
    case engineStarted
    case openWindows
    case loading(weight: Int)
}

struct Car {
    
    static let volumTrank: Int = 200
    let brand: Brand
    let yearsOfIssue: Int
    var currentVolumTruck: Int = 0
    
    var engineStarted: Bool = false
    var openWindows: Bool = false
    var trankFull: Bool = false
    
    mutating func runAction(action: ConditionCar) {
        switch action {
        case .engineStarted:
            self.engineStarted = true
        case .openWindows:
            self.openWindows = true
         case let .loading(weight):
            self.currentVolumTruck += weight
            self.trankFull = Car.volumTrank <= self.currentVolumTruck
         }
    }
}

struct Truck {
    
    static let volumTrank: Int = 500
    let brand: Brand
    let yearsOfIssue: Int
    var currentVolumTruck: Int = 0
    
    var engineStarted: Bool = false
    var openWindows: Bool = false
    var trankFull: Bool = false
    
    mutating func runAction(action: ConditionCar) {
        switch action {
        case .engineStarted:
            self.engineStarted = true
        case .openWindows:
            self.openWindows = true
        case let .loading(weight):
            self.currentVolumTruck += weight
            self.trankFull = Truck.volumTrank <= self.currentVolumTruck
         }
    }
}

var truck = Truck(brand: .reno, yearsOfIssue: 2010)
print(truck)
truck.runAction(action: .loading(weight: 499))
print(truck)

var car = Car(brand: .bmw, yearsOfIssue: 2005)
print(car)
car.runAction(action: .openWindows)
print(car)

