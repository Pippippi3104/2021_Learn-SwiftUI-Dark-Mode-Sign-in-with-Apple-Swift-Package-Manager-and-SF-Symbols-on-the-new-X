
// Math and Doubles

var height: Int = 47
let rideLimit: Int = 48

if height < rideLimit {
    let needToGrow: Int = rideLimit - height
    print(needToGrow)
}


var f: Double = 100.0
var g: Double = ((f - 32.0) * (5.0/9.0))


var daysInAYear: Double = 365.0
var daysInAWeek: Double = 7.0
var weeksInAYear: Double = (daysInAYear / daysInAWeek)
var weeksInAYearInt: Int = (Int(daysInAYear) / Int(daysInAWeek))


// Do math that has FLoat, Int, and Double in one Line

var a: Int = 6
var b: Double = 7.77777777777777
var c = Float(6)

Double(a) * b * Double(c)


// String Interporlationngiojgijriogjpr

let age: Int = 31
let name: String = "Nick"

print("Hi my name is \(name) and I am \(age) years old")


// Booleans

let isWeekend: Bool = true
if isWeekend {
    print("Enjoy your weekend !")
}
