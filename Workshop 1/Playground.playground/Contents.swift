
var myMoney = 10
let friendMoney = 20
print(myMoney + friendMoney)
//myMoney = myMoney + 30
myMoney += 30
print("Total amount is: " + String(myMoney))
print("Total amount is: \(myMoney)")



enum Directions {
    case south
    case north
    case east
    case west
}

struct MoveStruct {
    var direction: Directions
}

class MoveClass {
    var direction: Directions
    
    init(direction: Directions) {
        self.direction = direction
    }
}


var string = "Hello"
var array = [Character]()
for char in string {
    array.append(char)
}

var dict = [Int: Character]()
for (i, v) in array.enumerated() {
    dict[i] = v
}
print(dict)



protocol GameDelegate {
    func sayHello()
}

class Game: GameDelegate {
    
    func sayHello() {
        print("Hello")
    }
}

class Player {
    
    var delegate: GameDelegate?
    
    func hello() {
        delegate?.sayHello()
    }
}

let game = Game()
let player = Player()
player.delegate = game
player.hello()



let examM = 0.85
let examR = 94
let cwM = 0.15
let cwR = 99
let exam = Double(examR) * examM
let cw = Double(cwR) * cwM
let result = Int((exam + cw).rounded())



let temp = 77
switch temp {
case Int.min..<65:
    print("cold")
case 65...75:
    print("right")
default:
    print("hot")
}


let const1 = 25
let const2 = 14

var largest: Int
if const1 > const2 {
    largest = const1
} else {
    largest = const2
}
print(largest)
largest = const1 > const2 ? const1 : const2
print(largest)


func loopFor(until number: Int) {
    for value in 0..<number {
        print(value)
    }
}

func loopWhile(until number: Int) {
    var i = 0
    while i < number {
        print(i)
        i += 1
    }
}
loopFor(until: 3)
loopWhile(until: 3)
