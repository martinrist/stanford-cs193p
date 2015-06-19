/************************************************
* Swift Programming Language - Collection Types *
*************************************************/

/*****************************
 * Mutability of Collections *
 *****************************/

// `var` declares a mutable collection, so we can append elements to it
var coll1 = ["foo", "bar", "blort"]
coll1.append("baz")

// `let` declares an immutable collection, so .append() causes compilation error
let coll2 = ["foo", "bar", "blort"]
//coll2.append("baz")                   // This doesn't compile


var mutableString = "hello"
let immutableString = "world"

// A mutable collection that consists of a mutable string and an immutable string
var mutableColl = [mutableString, immutableString]
let bang : Character = "!"

// You can mutate a mutable String inside a mutable collection
mutableColl[0].append(bang)

// Apparently, you can also mutate a string declared with let in an immutable collection
mutableColl[1].append(bang)
mutableColl

// However, if the collection reference is immutable, you can't mutate any contents
let immutableColl = [mutableString, immutableString]
//immutableColl[0].append(bang);
//immutableColl[1].append(bang);



/**********
 * Arrays *
 **********/

// Full type of arrays is Array<T>, but it's also written [T]
// It can be initialised either as Array<T>() or [T]()
let arrayOfInts = [Int]()
arrayOfInts.dynamicType

// An alternative initialiser allows creation of an array of specified size / values
let threeZeroes = [Int](count: 3, repeatedValue: 0)

// Addition is overloaded for array concatentation
let threeOnes = [Int](count: 3, repeatedValue: 1)
let threeTwos = [Int](count: 3, repeatedValue: 2)
threeZeroes + threeOnes + threeTwos

// Array Literals are in square brackets
var shoppingList = ["Eggs", "Milk", "Sugar", "Apples", "Lettuce"]

// Array access is by subscript
shoppingList[0]

// Accessing via out of bounds index is a runtime error
// shoppingList[10]

// Common functions / properties of collection types also work for arrays
shoppingList.isEmpty
shoppingList.count
shoppingList.append("Flour")

// startIndex / endIndex also work, but plan subscripting is easier
shoppingList[shoppingList.startIndex.successor()]
shoppingList[1]

// Range syntax can be used to replace one or more existing elements
shoppingList
shoppingList[0...1] = ["Bananas"]
shoppingList

// Can insert and remove at specified indices
shoppingList.removeAtIndex(2)
shoppingList.insert("Beer", atIndex: 0)

// removeLast
shoppingList.removeLast()

// Iteration over an array
for item in shoppingList {
    println(item)
}

for (index, value) in enumerate(shoppingList) {
    println("Item \(index + 1) is: \(value)")
}



/********
 * Sets *
 ********/

// Sets don't allow duplicates
var setOfInts = Set<Int>()
setOfInts.insert(1)
setOfInts.insert(2)
setOfInts.insert(3)
setOfInts.insert(4)
setOfInts.insert(5)
setOfInts.insert(5)
setOfInts.insert(5)

// There's no Can initialise with an array literal, using a type annotation
var setOfInts2: Set<Int> = [1, 2, 3, 4, 5]

// Technically, we don't need to declare the generic type:
var setOfInts3: Set = [5, 4, 3, 2, 1]

// We still have insert and remove, which behave as expected
setOfInts.insert(10)
setOfInts.remove(10)
setOfInts

// Removing a non-existent value
setOfInts.remove(666)
setOfInts

// Set containment
setOfInts.contains(10)
setOfInts.contains(5)

// Common set operations
let a: Set = [1, 2, 3, 4, 5]
let b: Set = [3, 4, 5, 6, 7]
a.intersect(b)
a.union(b)
a.subtract(b)
a.exclusiveOr(b)

// Equality, subset and superset tests
let x: Set = [1, 2, 3]
let y: Set = [1, 2, 3]
let z: Set = [1, 2]
let w: Set = [3, 4]

x == y
z.isSubsetOf(x)
y.isSupersetOf(z)

// Subset / superset are inclusive, but there are strict versions
x.isSupersetOf(y)
x.isSubsetOf(y)
x.isStrictSupersetOf(y)
x.isStrictSubsetOf(y)

w.isDisjointWith(z)
