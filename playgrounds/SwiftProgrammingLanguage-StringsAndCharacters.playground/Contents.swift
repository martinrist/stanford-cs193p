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
func addBangs(var input: String) {
    input += "!!!"
}

// So, myString isn't modified outside the call to addBangs
var myString = "Hello"
addBangs(myString)
println(myString)


// Individual characters can be created by providing a Character type annotation
let bang : Character = "!"

// We can create a string by passing [Character] to the String initialiser
let catChars: [Character] = ["C", "a", "t"]
let catString = String(catChars)

// Concatenation and appending
let string1 = "Hello"
let string2 = " there"
var welcome = string1 + string2
welcome += ", Martin"
welcome.append(bang)


// String interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


// Use global count() function to count length of String
let hello = "Hello"
count(hello)


// Cannot access String components by index
// hello[0]        // this is a compilation error

// Instead, use startIndex and endIndex, which return a String.Index
hello.startIndex
hello.startIndex.dynamicType
hello[hello.startIndex]
hello.endIndex

// A String.Index can access preceding and successor index positions
hello[hello.startIndex.successor()]
hello[hello.endIndex.predecessor()]

// Or by advancing using the global advance() function
hello[advance(hello.startIndex, 3)]

// Global function indices will return a range of the indices in a string
// which can be used for iteration
indices(hello)
for i in indices(hello) {
    println("\(hello[i])")
}


// To insert content into a string, use insert:
var welcome2 = "hello"
welcome2.insert("!", atIndex: welcome2.endIndex)

// To insert another string, use splice:
welcome2.splice(" there", atIndex: welcome2.endIndex.predecessor())

// To remove and return character, use removeAtIndex:
welcome2.removeAtIndex(welcome2.endIndex.predecessor())
welcome2

// To remove a substring, use removeRange
let range = advance(welcome2.endIndex, -6)..<welcome2.endIndex
welcome2.removeRange(range)
welcome2



// Check whether string contains another suffix or prefix
let testString = "Hello World"
testString.hasPrefix("Hello")
testString.hasSuffix("World")






