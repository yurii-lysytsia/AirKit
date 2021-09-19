#  Swift

## Extensions

### BinaryInteger
```swift
let integer: Int = 256 // For all integers all the same

// Converting to different types of integers 
integer.toInt8() // `Int8(127)` because it's greatest `Int8` value
integer.toUInt8() // `UInt8(255)` because it's greatest `UInt8` value
...
integer.toUInt() // `UInt(256)` because it's normal value for `UInt`

// Converting to different types of floating
integer.toFloat() // `Float(256)` because it's normal value for `Float`
Int64.max.toFloat(or: -1) // `Float(-1)` because `Int64.max` is greater than `Float.greatestFiniteMagnitude`

integer.toDouble() // `Double(256)` because it's normal value for `Double`
Int64.max.toDouble(or: -1) // `Double(-1)` because `Int64.max` is greater than `Double.greatestFiniteMagnitude`

// Converting to string
integer.toString() // `String(256)`
integer.toString(integerDigits: 1) // `String(256)`
integer.toString(integerDigits: 5) // `String(00256)`
```

### BinaryFloatingPoint
```swift
let double: Double = 256.128 // For `Float` all the same

// Converting to different types of integers
double.toInt() // `Int(256)`
double.toUInt() // `UInt(256)`

// Converting to different types of floating
double.toFloat() // `Float(256.128)`

// Converting to string
double.toString(fractionDigits: 0) // `String(256)`
double.toString(fractionDigits: 1) // `String(256.1)`
double.toString(fractionDigits: 2) // `String(256.13)`
double.toString(fractionDigits: 3) // `String(256.128)`
```

### StringProtocol
```swift
// Converting to different types of integers
"0".toInt8() // `Int8(0)`
"123".toInt8() // `Int8(123)`
"-123".toInt8() // `Int8(-123)`
"1000".toInt8() // `nil` because string value greater than `Int8.max` value
"-1000".toInt8() // `nil` because string value less than `Int8.min` value
"abc".toInt8() // `nil` because string value isn't or invalid integer

// Converting to different types of floating
"123.456".toDouble() // `Double(123.456)`
"-123.456".toDouble() // `Double(-123.456)`
"abc".toDouble() // `nil` because string value isn't or invalid floating value

// Converting to string type
"abc+".dropLast().toString() // `String(abc)` instead `String.SubSequence`
```

### String
```swift
// Triming newlines and whitelines of string
var string = " Hello\n"
string.trimmed // Created new instanse `String(Hello)`
string.trim() // Modified `string` value to `String(Hello)`

// New values to avoid long conditions for string
let whitespace = " "
whitespace.isEmpty // false
whitespace.isBlank // true
whitespace.notEmptyOrNil // String(" ")
whitespace.notBlankOrNil // nil

let string = "Hello world!"
string.isBlank // false
string.notEmptyOrNil // String("Hello world!")
string.notBlankOrNil // String("Hello world!")

// Removing components
var string = "Hello world!"
string.removing(characterSet: .whitespaces) // String("Helloworld!")
string.removing(characterSet: .alphanumerics) // String(" !")

string.removing(string: "Hello") // String(" world!")
string.removing(string: "!") // String("Hello world")

string.remove(characterSet: .whitespaces) // String("Helloworld!")
string.remove(string: "world") // String("Hello!")

// Truncate string
let string = "Hello world!"
string.truncating(to: 20) // String("Hello...")
string.truncating(to: 5, addEllipsis: true) // String("Hello...")
string.truncating(to: 5, addEllipsis: false) // String("Hello")

// Capitalize first letter
let string = "hello world"
string.capitalizingFirstLetter() // String("Hello world")

// Abbreviate string
let string = "hello world how are you?"
string.abbreviating(separator: " ", maxSplits: 20) // String("HWHAY)"
string.abbreviating(separator: " ", maxSplits: 2, shouldUppercased: true) // String("HW")
string.abbreviating(separator: " ", maxSplits: 2, shouldUppercased: false) // String("hw")

// Base-64 encoding/decoding
let string = "hello world!"
let base64EncodedString = string.base64Encoding() // String("aGVsbG8gd29ybGQh")
base64EncodedString?.base64Decoding() // String("hello world!")
```
