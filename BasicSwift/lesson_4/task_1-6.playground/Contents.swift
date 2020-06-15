import UIKit

enum ModelCar {
    case bmw, mersedes, kia, mazda
}

enum ActionWictCar {
    case turnEngine(turn: Bool)
    case openWindows
    case closeWindows
    case loading(weight: Int)
    case pneumoSuspension(available: Bool)
}

class Car{
    var model: ModelCar
    var openWindows: Bool = false
    var yearsOfCar: Int
    var turnEngine: Bool = false
    
    
    init(model: ModelCar, yearsOfCar: Int){
        self.model = model
        self.yearsOfCar = yearsOfCar
    }
    
    func executeAction(action: ActionWictCar) {
        switch action {
        case .closeWindows:
            if !self.openWindows {
                print("Окна закрыты")
            }else {
                self.openWindows = false
            }
        case .openWindows:
            if self.openWindows {
                print("Окна открыты")
            }else {
                self.openWindows = true
            }
        case let .turnEngine(turn: turn):
            if turn, self.turnEngine {
                print("Двигатель включен")
            } else if !turn, !self.turnEngine {
                print("Двигатель выключен")
            } else {
                self.turnEngine = turn
            }
        default:
            return
        }
    }
}
    
class TrunkCar: Car {
    var currentVolumTruck: Int = 0
    var totalCapacity: Int
    
    init(totalCapacity: Int, model: ModelCar, yearsOfCar: Int) {
        self.totalCapacity = totalCapacity
        super.init(model: model, yearsOfCar: yearsOfCar)
    }
    override func executeAction(action: ActionWictCar) {
        super.executeAction(action: action)
        switch action {
        case let .loading(weight: weight):
            if  (self.currentVolumTruck + weight) > self.totalCapacity {
                print("Загрузить можно \(self.totalCapacity - (self.currentVolumTruck + weight)) кг")
            } else if (self.currentVolumTruck + weight) < 0 {
                print("Выгрузить можно \(self.currentVolumTruck) кг")
            }else {
                self.currentVolumTruck = weight
            }
        default:
            return
        }
        
    }
    func pirntTruck() {
        print("""
        Параметры грузовика:
         общая грузоподъемность \(self.totalCapacity)
         текущая загрузка \(self.currentVolumTruck)
         окна открыты \(self.openWindows)
         двигатель включен \(self.turnEngine)
            
            
        """)
    }
}

class SportCar: Car {
    
    var pneumo: Bool = false
    
    init(model: ModelCar, yearsOfCar: Int, pneumo: Bool) {
        self.pneumo = pneumo
        super.init(model: model, yearsOfCar: yearsOfCar)
    }
    
    override func executeAction(action: ActionWictCar) {
        super.executeAction(action: action)
        switch action {
        case let .pneumoSuspension(available: available):
            if self.pneumo, available {
                print("Пневмоподвеска есть")
            } else if !self.pneumo, !available {
                print("Пневмоподвескb нету")
            } else {
                self.pneumo = available
            }
        default:
            return
        }
    }
    
    func pirntSportcar() {
        print("""
        Параметры спорткара:
         пневматика \(self.pneumo)
         окна открыты \(self.openWindows)
         двигатель включен \(self.turnEngine)
            
            
        """)
    }
}

let trunck = TrunkCar(totalCapacity: 500, model: .bmw, yearsOfCar: 2010)
trunck.executeAction(action: .loading(weight: 120))
trunck.pirntTruck()

trunck.executeAction(action: .loading(weight: -200))
trunck.pirntTruck()

trunck.executeAction(action: .closeWindows)
trunck.pirntTruck()

trunck.executeAction(action: .closeWindows)
trunck.pirntTruck()

trunck.executeAction(action: .loading(weight: -200))
trunck.pirntTruck()

trunck.executeAction(action: .openWindows)
trunck.pirntTruck()

trunck.executeAction(action: .turnEngine(turn: true))
trunck.pirntTruck()

let sportCar = SportCar(model: .bmw, yearsOfCar: 1991, pneumo: true)
sportCar.executeAction(action: .closeWindows)
sportCar.pirntSportcar()

sportCar.executeAction(action: .openWindows)
sportCar.pirntSportcar()


sportCar.executeAction(action: .pneumoSuspension(available: true))
sportCar.pirntSportcar()


sportCar.executeAction(action: .turnEngine(turn: false))
sportCar.pirntSportcar()


sportCar.executeAction(action: .turnEngine(turn: true))
sportCar.pirntSportcar()


