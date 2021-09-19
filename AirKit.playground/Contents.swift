import AirKit

"0".toInt8() // `Int8(0)`
"123".toInt8() // `Int8(123)`
"-123".toInt8() // `Int8(-123)`
"1000".toInt8() // `nil` because string value greater than `Int8.max` value
"-1000".toInt8() // `nil` because string value less than `Int8.min` value
"abc".toInt8() // `nil` because string value isn't or invalid integer value

"123.456".toDouble() // `Double(123.456)`
"-123.456".toDouble() // `Double(-123.456)`
"abc".toDouble() // `nil` because string value isn't or invalid floating value

let defaultSwift = "abc+".dropLast().toString()
