//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirKit

class KeyedDecodingContainerTests: XCTestCase {
    
    // MARK: - Properties
    
    private let decoder = JSONDecoder()
    
    // MARK: - Tests
    
    func testDecode() throws {
        let json = try Bundle.json(filename: "swift-decode")
        let result = try decoder.decode(SomeModel.self, from: json)
        XCTAssertEqual(result.string, "123")
        XCTAssertEqual(result.stringInt, "123")
        XCTAssertEqual(result.stringBool, "true")
        XCTAssertNil(result.stringNull)
        XCTAssertEqual(result.int, 123)
        XCTAssertEqual(result.intString, 123)
        XCTAssertNil(result.intNull)
        XCTAssertEqual(result.double, 123.456)
        XCTAssertEqual(result.doubleString, 123.456)
        XCTAssertNil(result.doubleNull)
        XCTAssertTrue(result.bool)
        XCTAssertTrue(result.boolIntTrue)
        XCTAssertFalse(result.boolIntFalse)
        XCTAssertTrue(result.boolString)
        XCTAssertTrue(result.boolStringIntTrue)
        XCTAssertFalse(result.boolStringIntFalse)
        XCTAssertNil(result.boolNull)
    }
    
    // MARK: - Helers
    
    struct SomeModel: Decodable {
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
    
}
