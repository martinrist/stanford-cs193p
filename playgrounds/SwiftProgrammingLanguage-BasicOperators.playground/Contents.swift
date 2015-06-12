/***********************************************
* Swift Programming Language - Basic Operators *
************************************************/

/***********************
 * Assignment Operator *
 ***********************/

// The assignment operator doesn't return a value
var x = 1, y = 2
println(x=y)



/************************
 * Arithmetic Operators *
 ************************/

// By default, arithmetic operators are not overflowing
// Int.max + 1

// ++ / -- can be used as prefix and postfix, just like Java
var i = 0
++i
i++
i



/*******************
 * Range operators *
 *******************/

// Closed range operator includes both the lower and upper bounds
for a in 1...5 {
    println(a)
}

// Half-open range operator doesn't include the upper bound
for a in 1..<5 {
    println(a)
}