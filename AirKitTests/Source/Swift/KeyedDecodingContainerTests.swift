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
    }
    
    // MARK: - Helers
    
    struct SomeModel: Decodable, Equatable {
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
            doubleNull = try container.decode(forKey: .doubleNull)
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
        }
    }
    
}
