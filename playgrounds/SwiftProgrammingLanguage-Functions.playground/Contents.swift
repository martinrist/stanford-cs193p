/******************************************
 * Swift Programming Language - Functions *
 ******************************************/

/********************************
 * Defining & Calling Functions *
 ********************************/

// Simple, single-argument function with return type
func sayHello(personName: String) -> String {
    let greeting = "Hello \(personName)!"
    return greeting
}

// Simple call, with single parameter
sayHello("Martin")



/***************************************
 * Function Parameters & Return Values *
 ***************************************/

// Functions can have multiple parameters
func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

halfOpenRangeLength(1, 10)

// Or no arguments at all
func constantlyTrue() -> Bool {
    return true
}
constantlyTrue()

// Or can have no return value
func sayGoodbye(personName: String) {
    println("Goodbye \(personName)")
}
sayGoodbye("Martin")

// Technically, it returns Void / ()
sayGoodbye.dynamicType




/******************
 * Function Types *
 ******************/
// Every function has a type, made up of the parameter and return types
func addInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyInts(a: Int, b: Int) -> Int {
    return a * b
}

// addInts has type (Int, Int) -> Int
addInts.dynamicType

// We can assign a func to a var / const, with type annotations...
let addIntsAlias: (Int, Int) -> Int = addInts
addIntsAlias(1, 2)

// ... but type inference will take care of the need for annotations
let addIntsAnotherAlias = addInts
addIntsAnotherAlias.dynamicType
addIntsAnotherAlias(4, 5)



// Function types can be parameter types
func processMathFunction(mathFunction: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    return mathFunction(a, b)
}

processMathFunction(addInts, 2, 4)
processMathFunction(multiplyInts, 2, 4)



// Function types can also be return types
// makeDoubleApplier() takes a unary function f: Int -> Int and returns a function that applies f twice
func makeDoubleApplier(f: Int -> Int) -> (Int -> Int) {
    func result(a: Int) -> Int {
        return f(f(a))
    }
    return result
}

func square(a: Int) -> Int {
    return a * a
}

makeDoubleApplier(square)(2)



/********************
 * Nested Functions *
 ********************/
// Nested functions are declared in the scope of another function
// See `makeDoubleApplier` above for an example