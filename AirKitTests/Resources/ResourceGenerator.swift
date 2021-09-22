//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import Foundation

// TODO: - Remove when this extension will appear on AirKit

extension Bundle {
    static func json(filename: String) throws -> Data {
        guard let url = Bundle(for: ResourceGenerator.self).url(forResource: filename, withExtension: "json") else {
            throw NSError()
        }
        return try Data(contentsOf: url, options: .mappedIfSafe)
    }
}

private final class ResourceGenerator { }
