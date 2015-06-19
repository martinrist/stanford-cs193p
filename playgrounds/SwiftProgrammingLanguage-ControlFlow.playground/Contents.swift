/*********************************************
 * Swift Programming Language - Control Flow *
 *********************************************/

/*************
 * For loops *
 *************/

// for-in will iterate over a sequence
for index in 1...5 {
    println("\(index) times 5 is \(index * 5)")
}

// loop variables are immutable by default
for index in 1...5 {
    // index++          // Compilation error
}

// If you don't need the loop variable, use _
var sum = 0
for _ in 1...5 {
    sum += 10
}
sum

// Traditional, C-style for loops are also available
// the loop variable needs to be declared a var, as it's mutated
for var index = 0; index < 3; ++index {
    println("index is \(index)")
}



/***************
 * While loops *
 ***************/

// while evaluates its condition at the start of each pass
var test = false
while test {
    println("This will never print")
}

// do-while evaluates its condition at the end of each pass
do {
    println("This will print once")
} while test



/**************************
 * Conditional Statements *
 **************************/

