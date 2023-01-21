//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import Foundation

// MARK: - Extensions | Contents

public extension FileManager {
    /// Returns `true` if a file or directory exists at a specified url path.
    func fileExists(at url: URL) -> Bool { fileExists(atPath: url.path) }
    
    /// Performs a shallow search of the specified directory and returns URLs for the contained items.
    func contentsOfDirectory(at url: URL) throws -> (directories: [URL], files: [URL]) {
        let contents = try contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        let dividedContents = contents.divided(by: { $0.hasDirectoryPath })
        return (dividedContents.matched, dividedContents.nonMatched)
    }
    
    /// Performs a shallow search of the specified directory and returns URLs for the contained files with given extension only.
    func contentsOfDirectory(at url: URL, withExtension ext: String) throws -> [URL] {
        try contentsOfDirectory(at: url).files.filter { $0.pathExtension == ext }
    }
}
#endif
