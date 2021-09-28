//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation)
import class Foundation.Bundle

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
#endif
