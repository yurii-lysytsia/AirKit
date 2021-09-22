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
        XCTAssert(result.string == "123")
        XCTAssert(result.stringInt == "123")
        XCTAssert(result.stringBool == "true")
        XCTAssert(result.stringNull == nil)
        XCTAssert(result.int == 123)
        XCTAssert(result.intString == 123)
        XCTAssert(result.intNull == nil)
        XCTAssert(result.double == 123.456)
        XCTAssert(result.doubleString == 123.456)
        XCTAssert(result.doubleNull == nil)
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
