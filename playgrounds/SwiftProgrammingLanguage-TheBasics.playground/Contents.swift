/*******************************************
 * Swift Programming Language - The Basics *
 *******************************************/

/***************************
 * Constants and Variables *
 ***************************/

// The type annotation here isn't necessary
var welcomeMessage: String = "Hello"

// Multiple related variables can be separated with commas, and can share a type annotion
var red, green, blue: Double
var yellow: Double, message: String, counter: Int

// println is a 'global function', so it doesn't require any qualification
println("Hello World")

// String interpolation 
println("welcomeMessage = \(welcomeMessage)")


/************
 * Comments *
 ************/

/* Multiline comments can be nested:
    /*
     * Like this
     */
*/


/************
 * Integers *
 ************/

// There are signed- and unsigned versions of specific-precision integers
// The type annotations aren't really needed here
let uint8min : UInt8 = UInt8.min
let uint8Max : UInt8 = UInt8.max
let int8Min : Int8 = Int8.min
let int8Max : Int8 = Int8.max

let uint16Min : UInt16 = UInt16.min
let uint16Max : UInt16 = UInt16.max
let int16Min : Int16 = Int16.min
let int16Max : Int16 = Int16.max

let uint32Min : UInt32 = UInt32.min
let uint32Max : UInt32 = UInt32.max
let int32Min : Int32 = Int32.min
let int32Max : Int32 = Int32.max

let uint64Min : UInt64 = UInt64.min
let uint64Max : UInt64 = UInt64.max
let int64Min : Int64 = Int64.min
let int64Max : Int64 = Int64.max

// ... But it's preferable to use Int / UInt
// these default to a word size suitable for the machine
let intMin = Int.min
let intMax = Int.max
let uintMin = UInt.min
let uintMax = UInt.max


/*************
 * Optionals *
 *************/

// `convertedNumber` is an Int? - i.e. an Optional<Int>
let validNumber = "123"
let convertedNumber = validNumber.toInt()

// Note here that this gets output as Optional(123)
if convertedNumber != nil {
    println("Number was converted to \(convertedNumber)")
}

// Use ! to force unwrapping of the Optional
if convertedNumber != nil {
    println("Number was converted to \(convertedNumber!)")
}


// `unconvertedNumber` is nil, because `invalidNumber` can't be parsed
let invalidNumber = "Hello world"
let unconvertedNumber = invalidNumber.toInt()


// Optional binding can be used to only run a conditional branch
// if an Optional contains a value
if let actualNumber = validNumber.toInt() {
    println("Number is valid -> \(actualNumber)")
} else {
    println("Number is not valid")
}

if let actualNumber = invalidNumber.toInt() {
    println("Number is valid -> \(actualNumber)")
} else {
    println("Number is not valid")
}


// Implicitly unwrapped optionals don't require explicit unwrapping
var alwaysValid : Int!
alwaysValid = "123".toInt()
println(alwaysValid)


/**************
 * Assertions *
 **************/

// Assertions are another global function
assert(1 + 1 == 2, "One plus one should really equal 2")

// This will cause the app to terminate at runtime (we hope!)
assert(2 + 2 == 5, "Two plus two equals 5?")









