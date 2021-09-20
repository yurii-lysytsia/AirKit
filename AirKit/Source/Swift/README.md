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
