/****************************************************
* Swift Programming Language - Strings & Characters *
*****************************************************/

// Strings have an .isEmpty property
var emptyString = ""
emptyString.isEmpty

// Strings assigned to constants are immutable
// whereas those assigned to variables are mutable
let immutableString = "Hello"
//immutableString += " world!"     // This would give a compilation error

var mutableString = "Hello"
mutableString += " world!"


// Strings are value types, so they have copy-by-value semantics
var myString = "Hello"


func addBangs(var input: String) {
    input += "!!!"
}

addBangs("Hello")
