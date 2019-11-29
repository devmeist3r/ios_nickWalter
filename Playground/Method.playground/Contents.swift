// Classes

class Dog {
    var age = 10
    var furColor = ""
    var name = ""
    
    func bark() {
        print("Woof Woof")
    }
    
    func dogInfo() -> String {
        return "This is \(name) who is \(self.age) years old and has \(furColor) fur"
    }
    
    func double() {
        age = age * 2
    }
}

var dog1 = Dog()

dog1.age = 8
dog1.name = "Fido"
dog1.furColor = "Black"
dog1.bark()
dog1.double()
dog1.dogInfo()


var dog2 = Dog()

print(dog2.age)

class WaterBottle {
    var volume = 0
    var brand = ""
}

var myBottle = WaterBottle()
myBottle.brand = "Krogger"
myBottle.volume = 500

