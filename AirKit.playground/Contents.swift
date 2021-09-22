



import Foundation

struct SomeModel: Decodable {
    let value: Data
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(forKey: .value)
    }
    
    enum CodingKeys: CodingKey {
        case value
    }
}

let json = """
    [
        {"value": "2021-09-22T15:05:30+00:00"}
    ]
""".data(using: .utf8)!

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let array = try decoder.decode([SomeModel].self, from: json)



