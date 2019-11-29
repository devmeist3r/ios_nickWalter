// Functions

func printMessage() {
    print("Hello functions!")
}

printMessage()

func happyBirthday(name: String, age: Int) {
    print("Happy \(age) Birthday \(name)")
}

happyBirthday(name: "Lucas", age: 26)

func printMessageParams(message: String) {
    print("Say something: \(message)")
}

printMessageParams(message: "Hello world")

func sumValue(num1: Int, num2: Int) {
    print(num1 + num2)
}

sumValue(num1: 4, num2: 8)
