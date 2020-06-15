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

protocol Car{
    var model: ModelCar { get }
    var openWindows: Bool { get set }
    var yearsOfCar: Int { get }
    var turnEngine: Bool { get set }
    
    func executeAction(action: ActionWictCar) -> ()
}

extension Car{
    
    func actionWithWindows(action: Bool) -> Bool{
        
         if !openWindows, !action {
            print("Окна закрыты")
        }
    
        if openWindows, action {
            print("Окна открыты")
        }
        
        return action
        
    }
    
    func actionTurnEngine(turn: Bool) -> Bool{
        
        if turn, turnEngine {
            print("Двигатель включен")

        } else if !turn, !turnEngine {
            print("Двигатель выключен")
        
        }
        return turn
    }
    
}

class TrunkCar: Car {
    
    var model: ModelCar
    var openWindows: Bool = false
    var yearsOfCar: Int
    var turnEngine: Bool = false
    var currentVolumTruck: Int = 0
    var totalCapacity: Int
    
    init(totalCapacity: Int, model: ModelCar, yearsOfCar: Int) {
        self.totalCapacity  = totalCapacity
        self.model          = model
        self.yearsOfCar     = yearsOfCar
    }
    
    func executeAction(action: ActionWictCar) {
                                
        switch action {
        case .closeWindows:
            self.openWindows = actionWithWindows(action: false)
        case .openWindows:
            self.openWindows = actionWithWindows(action: true)
        case let .turnEngine(turn: turn):
            self.turnEngine = actionTurnEngine(turn: turn)
        case let .loading(weight: weight):
            if  (self.currentVolumTruck + weight) > self.totalCapacity {
                print("Загрузить можно \(self.totalCapacity - (self.currentVolumTruck + weight)) кг")
            } else if (self.currentVolumTruck + weight) < 0 {
                print("Выгрузить можно \(self.currentVolumTruck) кг")
            }else {
                self.currentVolumTruck = weight
            }
        default:
            print("действие недопустимо")
        }
        
 
    }
 

}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        """
        Параметры грузовика:
         модель \(self.model)
         общая грузоподъемность \(self.totalCapacity)
         текущая загрузка \(self.currentVolumTruck)
         окна открыты \(self.openWindows)
         двигатель включен \(self.turnEngine)
            
            
        """
    }
}


class SportCar: Car {
    var model: ModelCar
    var openWindows: Bool = false
    var yearsOfCar: Int
    var turnEngine: Bool = false
    var pneumo: Bool = false
    
    init(model: ModelCar, yearsOfCar: Int, pneumo: Bool) {
        self.pneumo     = pneumo
        self.model      = model
        self.yearsOfCar = yearsOfCar
        
    }
    
    func executeAction(action: ActionWictCar) {
            
        switch action {
        case .closeWindows:
            self.openWindows = actionWithWindows(action: false)
        case .openWindows:
            self.openWindows = actionWithWindows(action: true)
        case let .turnEngine(turn: turn):
            self.turnEngine = actionTurnEngine(turn: turn)
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
    
}

extension SportCar: CustomStringConvertible {
   
    var description: String {"""
        Параметры спорткара:
         модель \(self.model)
         пневматика \(self.pneumo)
         окна открыты \(self.openWindows)
         двигатель включен \(self.turnEngine)
            
            
        """
        
    }
    
}

let trunck = TrunkCar(totalCapacity: 500, model: .bmw, yearsOfCar: 2010)
trunck.executeAction(action: .loading(weight: 120))
trunck.executeAction(action: .openWindows)
trunck.executeAction(action: .turnEngine(turn: true))
print(trunck)
trunck.executeAction(action: .loading(weight: -200))
print(trunck)
trunck.executeAction(action: .closeWindows)
print(trunck)

let trunck2 = TrunkCar(totalCapacity: 500, model: .mazda, yearsOfCar: 2005)
trunck2.executeAction(action: .openWindows)
print(trunck2)

trunck.executeAction(action: .loading(weight: -200))
print(trunck)

let trunck3 = TrunkCar(totalCapacity: 20, model: .mersedes, yearsOfCar: 2010)
trunck3.executeAction(action: .openWindows)
print(trunck3)
trunck3.executeAction(action: .turnEngine(turn: true))
print(trunck3)

let sportCar = SportCar(model: .bmw, yearsOfCar: 1991, pneumo: true)
sportCar.executeAction(action: .closeWindows)
print(sportCar)

let sportCar2 = SportCar(model: .kia, yearsOfCar: 2018, pneumo: true)
sportCar2.executeAction(action: .openWindows)
print(sportCar2)
sportCar2.executeAction(action: .pneumoSuspension(available: true))
print(sportCar2)

let sportCar3 = SportCar(model: .mazda, yearsOfCar: 2018, pneumo: false)
sportCar3.executeAction(action: .turnEngine(turn: false))
print(sportCar3)
sportCar3.executeAction(action: .turnEngine(turn: true))
print(sportCar3)

