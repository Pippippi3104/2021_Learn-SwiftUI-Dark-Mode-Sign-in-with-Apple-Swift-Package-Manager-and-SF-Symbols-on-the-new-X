// Functions
func printMessage(message: String) {
    print(message)
}
printMessage(message: "It works !")

func happyBirthday(name: String, age: Int) {
    print("Happy \(age) Birthday \(name) !")
}
happyBirthday(name: "Rick", age: 8)


// Make a function that takes 2 ints, add them together and print result
func addNumbers(num1: Int, num2: Int) {
    print(num1 + num2)
}
addNumbers(num1: 3, num2: 5)


// Return
func addNumbers2(num1: Int, num2: Int) -> Int{
    return num1 + num2
}
var sum = addNumbers2(num1: 3, num2: 5)
sum * 3


// Classes
class Dog {
    var age: Int = 0
    var furColor: String = ""
    var name: String = ""
}
var dog1 = Dog()
dog1.age = 8
dog1.name = "Fido"
dog1.furColor = "Black"

var dog2 = Dog()
dog2.age = 67
print(dog2.age)


// Make a class for something nearby
// Create an object from that class for the thing next you
class waterBottle {
    var volume: Int = 0
    var brand: String = ""
}
var myBottle = waterBottle()
myBottle.brand = "Kroger"
myBottle.volume = 500


// Methods
class Dog2 {
    var age: Int = 0
    var furColor: String = ""
    var name: String = ""
    func bark() {
        print("Woof Woof !")
    }
    func dogInfo() -> String{
        return "This is \(name) who is \(age) years old and has \(furColor) fur."
    }
}
var dog3 = Dog2()
dog3.bark()
dog3.dogInfo()


// Inheritance
class Animal {
    var age: Int = 0
    var name: String = ""
    func speak() {
        print("")
    }
}
class Dog3: Animal {
    var furColor: String = ""
    override func speak() {
        print("Woof Woof !")
    }
}
var dog4 = Dog3()
dog4.speak()


// Optional
var age: Int? = nil
