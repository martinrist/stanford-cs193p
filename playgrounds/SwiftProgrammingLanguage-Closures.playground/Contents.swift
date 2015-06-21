/*****************************************
 * Swift Programming Language - Closures *
 *****************************************/

/***********************
 * Closure Expressions *
 ***********************/
// Here is an array of names that we want to sort
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// The `sorted` global function takes an Array<T> and a comparator function of type (T, T) -> Bool

// We can write a normal function to sort the strings backwards
func backwardsSort(s1: String, s2: String) -> Bool {
    return s1 > s2
}

sorted(names, backwardsSort)


// Using the full closure syntax, we can provide the function inline:
var reversed = sorted(names, { (s1: String, s2: String) -> Bool in return s1 > s2 })
reversed

// First optimisation - inferring the type of closure args / return type from the signature of the method argument
// This is always possible when closure is passed as a function argument
reversed = sorted(names, { s1, s2 in return s1 > s2 })
reversed

// Second optimisation - implicit return from single-expression closure
reversed = sorted(names, { s1, s2 in s1 > s2 })
reversed

// Third optimisation - shorthand argument names
reversed = sorted(names, { $0 > $1 })
reversed

// Fourth optimisation - operator functions - > is a function (String, String) -> Bool
reversed = sorted(names, >)


/*********************
 * Trailing Closures *
 *********************/
// When a closure is passed to a function as the final argument, it is called a 'trailing closure'.
// Trailing closures can be moved outside the function call parens
reversed = sorted(names) { $0 > $1 }
reversed

// If the closure is the only argument, you can omit the function call parens completely.
let numbers = [1, 2, 3, 4, 5]
let squares = numbers.map { $0 * $0 }
squares