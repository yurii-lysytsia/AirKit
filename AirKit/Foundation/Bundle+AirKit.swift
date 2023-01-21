//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

// MARK: - Extensions | Resources

public extension Bundle {
    /// Returns a new `Data` instance of object for the resource file identified by the specified name and extension and residing in a given bundle directory.
    /// - Parameters:
    ///   - filename: The name of a resource file contained in the directory specified by subpath.
    ///   - withExtenson: The filename extension of the file to locate.
    ///   - subdirectory: The name of the bundle subdirectory to search.
    ///   - localization: The language ID for the localization. This parameter should correspond to the name of one of the bundle's language-specific resource directories without the .lproj extension.
    /// - Returns: A new Data instance for the resource file or nil if the file could not be located.
    func data(filename: String, withExtenson ext: String, subdirectory: String? = nil, localization: String? = nil) throws -> Data {
        guard let url = url(forResource: filename, withExtension: ext, subdirectory: subdirectory, localization: localization) else {
            throw NSError(domain: "AirKit.Bundle", code: -1, userInfo: [
                NSLocalizedDescriptionKey: "\(#function) Any resource with filename `\(filename).\(ext)` was not found"
            ])
        }
        return try Data(contentsOf: url, options: .mappedIfSafe)
    }
}

// MARK: - Extensions | Version

public extension Bundle {
    /// Returns model representation build version.
    var infoBuildVersion: Version { Version(version: info.buildVersionShort) }
}

// MARK: - Extensions | Info

public extension Bundle {
    /// Returns new instance of `Info.plist` model.
    var info: Info {
        Info(
            name: infoValue(forKey: "CFBundleName") ?? "Unknown",
            displayName: infoValue(forKey: "CFBundleDisplayName") ?? "Unknown",
            identifier: infoValue(forKey: "CFBundleIdentifier") ?? "Unknown",
            buildVersion: infoValue(forKey: "CFBundleVersion") ?? "0",
            buildVersionShort: infoValue(forKey: "CFBundleShortVersionString") ?? "0.0.0",
            executable: infoValue(forKey: "CFBundleExecutable") ?? "Unknown"
        )
    }
    
    /// Returns value  from `infoDictionary` with given key.
    func infoValue<Value>(forKey key: String) -> Value? { infoDictionary?[key] as? Value }
    
    /// Incapsulated models based on `Info.plist` general values.
    struct Info {
        public let name: String
        public let displayName: String
        public let identifier: String
        public let buildVersion: String
        public let buildVersionShort: String
        public let executable: String
    }
}

// MARK: - Extension | Environment

public extension Bundle {
    /// Application running environment.
    enum Environment {
        /// Application is running in debug mode.
        case debug
        /// Application is installed from the Test Flight.
        case testFlight
        /// Application is installed from the App Store.
        case appStore
    }

    /// Return the current inferred app environment.
    var currentEnvironment: Environment {
        // If flag is `DEBUG` or app was runned on simulator
        #if DEBUG || targetEnvironment(simulator)
        return .debug
        #else
        if path(forResource: "embedded", ofType: "mobileprovision") != nil {
            return .testFlight
        }

        guard let appStoreReceiptUrl = appStoreReceiptURL else {
            return .debug
        }

        if appStoreReceiptUrl.lastPathComponent.lowercased() == "sandboxreceipt" {
            return .testFlight
        }
        
        if appStoreReceiptUrl.path.lowercased().contains("simulator") {
            return .debug
        }

        return .appStore
        #endif
    }
}
