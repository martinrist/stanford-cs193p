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



/**************************************
 * Conditional Statements - if / else *
 **************************************/

// If / else / else if
let temp = 90
if temp <= 0 {
    println("Water is ice at \(temp) degrees")
} else if temp >= 100 {
    println("Water is steam at \(temp) degrees")
} else {
    println("Water is just plain old water at \(temp) degrees")
}


// This makes it look like `if` is an expression...
if temp <= 0 {
    "solid"
} else if temp >= 100 {
    "gas"
} else {
    "liquid"
}

// But this gives a compilation error, 'Expected expression in assignment', which suggests it isn't
//var state: String = ""
//state = if temp <= 0 {"solid"} else {"not solid"}


/***********************************
 * Conditional Statements - switch *
 ***********************************/

let option = 1
switch option {
case 1:
    println("Option 1 chosen")
    // No fallthrough by default
    
// Multiple options possible by separating with commas
case 2, 3, 4, 5:
    println("One of options 2 - 5 chosen")

// body of each case must include at least one executable statement, so
// uncommenting this case would be a compile error
// case 6:
    
// switch statements must be exhaustive - provide a `default` case to catch remainder
default:
    println("Some other option chosen")
}

// Intervals / ranges can be used to match cases
let count = 212
var naturalCount: String
switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
default:
    naturalCount = "loads of"
}



/*******************************
 * Control Transfer Statements *
 *******************************/

// `continue` tells a loop to restart at the beginning of the next iteration
let input = "great minds think alike"
var output = ""
for char in input {
    switch char {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        output.append(char)
    }
}
output


// `break` ends execution of an entire control flow statement immediately
output = ""
for char in input {
    if char == " " {
        break
    } else {
        output.append(char)
    }
}
output


// `fallthrough` returns traditional C- / Java-style fallthrough to `switch` statements
output = ""
let vowelReplacement: Character = "x"
for char in input {
    switch char {
    case "a":
        fallthrough
    case "e":
        fallthrough
    case "i":
        fallthrough
    case "o":
        fallthrough
    case "u":
        output.append(vowelReplacement)
    default:
        output.append(char)
    }
}
output




