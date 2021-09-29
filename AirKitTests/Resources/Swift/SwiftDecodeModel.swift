//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

struct SwiftDecodeModel: Decodable {
    let string: String
    let stringInt: String
    let stringBool: String
    let stringNull: String?
    let int: Int
    let intString: Int
    let intNull: Int?
    let double: Double
    let doubleString: Double
    let doubleNull: Double?
    let bool: Bool
    let boolIntTrue: Bool
    let boolIntFalse: Bool
    let boolString: Bool
    let boolStringIntTrue: Bool
    let boolStringIntFalse: Bool
    let boolNull: Bool?
    let customDecodable: CustomDecodable
    let customDecodableNull: CustomDecodable?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        string = try container.decode(forKey: .string)
        stringInt = try container.decode(forKey: .stringInt)
        stringBool = try container.decode(forKey: .stringBool)
        stringNull = try container.decodeIfPresent(forKey: .stringNull)
        
        int = try container.decode(forKey: .int)
        intString = try container.decode(forKey: .intString)
        intNull = try container.decodeIfPresent(forKey: .intNull)
        
        double = try container.decode(forKey: .double)
        doubleString = try container.decode(forKey: .doubleString)
        doubleNull = try container.decodeIfPresent(forKey: .doubleNull)
        
        bool = try container.decode(forKey: .bool)
        boolIntTrue = try container.decode(forKey: .boolIntTrue)
        boolIntFalse = try container.decode(forKey: .boolIntFalse)
        boolString = try container.decode(forKey: .boolString)
        boolStringIntTrue = try container.decode(forKey: .boolStringIntTrue)
        boolStringIntFalse = try container.decode(forKey: .boolStringIntFalse)
        boolNull = try container.decodeIfPresent(forKey: .boolNull)
        
        customDecodable = try container.decode(forKey: .customDecodable)
        customDecodableNull = try container.decodeIfPresent(forKey: .customDecodableNull)
    }
    
    enum CodingKeys: CodingKey {
        case string
        case stringInt
        case stringBool
        case stringNull
        case int
        case intString
        case intNull
        case double
        case doubleString
        case doubleNull
        case bool
        case boolIntTrue
        case boolIntFalse
        case boolString
        case boolStringIntTrue
        case boolStringIntFalse
        case boolNull
        case customDecodable
        case customDecodableNull
    }
    
    struct CustomDecodable: Decodable {
        let id: String
    }
}
