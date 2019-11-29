// Inheritance

class Animal {
    var age = 0
    var name = ""
    
    func speak() {
        print("")
    }
}

class Dog : Animal {
    var furcolor = ""
    
    override func speak() {
        print("Wolf wolf")
    }
}

var dog1 = Dog()

dog1.speak()
