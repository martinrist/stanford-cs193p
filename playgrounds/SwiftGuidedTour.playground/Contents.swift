//: Playground - noun: a place where people can play

import UIKit

// Obligatory "Hello World"
println("Hello, world!")

// Variables and constants
var myVariable = 42
myVariable = 50
let myConstant = 42

// Type hints
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

// Type conversion must be explicit
let label = "The width is "
let width = 94
let widthLabel = label + String(width)


// String interpolation
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
let floatingPointCalc = "1.2 x 3.5 = \(1.2 * 3.5)"


// Array creation and manipulation
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
let firstItem = shoppingList[0]
shoppingList[1] = "bottle of water"
let secondItem = shoppingList[1]


// Dictionary creation and manipulation
var occupations = ["Malcolm": "Captain",
                   "Kaylee": "Mechanic"]
occupations["Malcolm"]
occupations["Kaylee"] = "Chief Mechanic"
occupations["Jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String: Float]()


// Iteration and conditionals
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
println(teamScore)


// Optionals and 'if let'
var optionalString: String? = "Hello"
println(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}


// Switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log"
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich"
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}