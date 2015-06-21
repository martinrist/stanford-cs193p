/*******************************************
 * Swift Programming Language - Properties *
 *******************************************/

import Foundation

/*********************
 * Stored properties *
 *********************/

// Stored properties can be mutable (var) or immutable (let)
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

// Cannot set immutable `length` property declared with `let`
//rangeOfThreeItems.length = 4     // Compile error

// If instance of a structure is assigned to a constant, you can't even modify the variable properties.
// This is because structures are Value Types.  When an instance of a value type is marked as constant, so are all of its properties
let rangeOfFourItems = FixedLengthRange(firstValue: 1, length: 4)

// Both of these will cause compilation errors
// rangeOfFourItems.firstValue = 4
// rangeOfFourItems.length = 3


// In contrast, classes are Reference Types
class FixedLengthRangeClass {
    var firstValue: Int = 0
    let length: Int = 5
}

// Behaviour is the same as for Value Types when assigned to a variable
var fixedLengthRange1 = FixedLengthRangeClass()
fixedLengthRange1.firstValue = 1
// Compile error - can't modify a constant property of a Reference Type assigned to a variable
// fixedLengthRange1.length = 10

// But when Reference Types are assigned to a constant, you can modify the variable properties
let fixedLengthRange2 = FixedLengthRangeClass()
fixedLengthRange1.firstValue = 1
// However, you still can't modify the constant properties
// fixedLengthRange1.length = 10



/***********************
 * Computed Properties *
 ***********************/
// Computed properties provide a getter and setter

// The point class allows us to see a polar representation
struct Point {
    var x = 0.0, y = 0.0

    // r has both a getter and setter
    var r: Double {
        get {
            return sqrt(x * x + y * y)
        }
        // If we missed `newR` out, we could just use `newValue`
        set(newR) {
           let scaleFactor = newR / r
            x = x * scaleFactor
            y = y * scaleFactor
        }
    }
    
    // But theta only has a getter, so we can't set it
    var th: Double {
        get {
            return atan2(y, x)
        }
    }
}

var p1 = Point(x: 2, y: 1)
p1.r
p1.th
p1.r = p1.r / 2

// This would cause a compilation error, as we've not provided a setter for `th`
// p1.th = p1.th / 2