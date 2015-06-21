/*****************************************************
 * Swift Programming Language - Classes & Structures *
 *****************************************************/

/**********************************
 * Comparing Classes & Structures *
 **********************************/

// Classes and structures use similar syntax for definition
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

struct Resolution {
    var width = 0
    var height = 0
}


// Creating instances is also similar for structures and classes
let someResolution = Resolution()
let someVideoMode = VideoMode()


// Property access is via the dot syntax, for both setting and getting
someResolution.width
someVideoMode.interlaced
someVideoMode.resolution.height
someVideoMode.frameRate = 60
someVideoMode.resolution.height = 200
someVideoMode


// It's possible to use memberwise initialisation for structure types (but not classes)
let vga = Resolution(width: 640, height: 480)