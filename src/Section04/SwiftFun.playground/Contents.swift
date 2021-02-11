// Array
var favCandy = ["Fun Di", "Sinckers", "Hichews"]

// .first
favCandy.first

// .last
favCandy.last

// [0] index
favCandy[0] = "Fun Dip"

// .count
favCandy.count

// .append()
favCandy.append("H. Kiss")

// .insert()
favCandy.insert("Smarties", at: 0)

// .remove()
favCandy.remove(at: 4)


// Make an array of your favorite numbers and then remove one
var favNumbers = [3, 8, 1, 14, 29]
favNumbers.remove(at: 2)


// Loops
for x in 1...10 {
    print(x)
}
for candy in favCandy {
    print(candy)
}
