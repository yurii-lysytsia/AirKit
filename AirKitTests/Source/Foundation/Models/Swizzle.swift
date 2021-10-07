//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

#if canImport(Foundation) && canImport(ObjectiveC)
import protocol Foundation.LocalizedError
import struct ObjectiveC.Selector
import func ObjectiveC.object_getClass
import func ObjectiveC.class_getInstanceMethod
import func ObjectiveC.class_addMethod
import func ObjectiveC.class_getInstanceMethod
import func ObjectiveC.class_replaceMethod
import func ObjectiveC.method_getImplementation
import func ObjectiveC.method_getTypeEncoding
import func ObjectiveC.method_exchangeImplementations

public enum Swizzle {
    /// Swizzle original instance or class method.
    private static func swizzleMethod(classType: AnyClass, original originalSelector: Selector, swizzled swizzledSelector: Selector, isClassMethod: Bool) throws {
        // Define class type if it is needed.
        var classType: AnyClass = classType
        if isClassMethod {
            guard let newClassType = object_getClass(classType) else { throw SwizzleError.invalidClassType }
            classType = newClassType
        }
        
        // Check is instance methods valid
        guard let originalMethod = class_getInstanceMethod(classType, originalSelector) else { throw SwizzleError.invalidOriginalMethod }
        guard let swizzledMethod = class_getInstanceMethod(classType, swizzledSelector) else { throw SwizzleError.invalidSwizzledMethod }
        
        // Swizzle methods
        if class_addMethod(classType, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)) {
            class_replaceMethod(classType, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    /// Swizzle original instance method.
    static func swizzleInstanceMethod<T: AnyObject>(classType: T.Type, original originalSelector: Selector, swizzled swizzledSelector: Selector) throws {
        try swizzleMethod(classType: T.self, original: originalSelector, swizzled: swizzledSelector, isClassMethod: false)
    }

    /// Swizzle original class method.
    static func swizzleClassMethod<T: AnyObject>(classType: T.Type, original originalSelector: Selector, swizzled swizzledSelector: Selector) throws {
        try swizzleMethod(classType: T.self, original: originalSelector, swizzled: swizzledSelector, isClassMethod: true)
    }
}

/// An error that occurs during the swizzling of methods
public enum SwizzleError: String, LocalizedError {
    case invalidClassType
    case invalidOriginalMethod
    case invalidSwizzledMethod
    
    public var errorDescription: String? {
        return localizedDescription
    }
    
    public var localizedDescription: String {
        switch self {
        case .invalidClassType:
            return "Class type is invalid. Please check it and try again"
        case .invalidOriginalMethod:
            return "Original instance method is invalid. Please check it and try again"
        case .invalidSwizzledMethod:
            return "Swizzled instance method is invalid. Please check it and try again"
        }
    }
}
#endif
