import AirKit

extension Sequence where Element: Sequence {
    
    func reduce() -> [Element.Element] {
        reduce([]) { $0 + $1 }
    }
    
}

let array = [["A"], ["B"], ["C"], ["D"]]
array.reduce() // ["A", "B", "C", "D"]

//let newArray = array.reduce([]) { $0 + $1 }
//newArray
