//  Copyright © 2021 Yurii Lysytsia. All rights reserved.

import XCTest
@testable import AirUIKit

final class UIColorTests: XCTestCase {
    
    func testRandomAndAlpha() {
        XCTAssertEqual(UIColor.random(alpha: 1).alpha, 1, accuracy: 0.1)
        XCTAssertEqual(UIColor.random(alpha: 0.6).alpha, 0.6, accuracy: 0.1)
        XCTAssertEqual(UIColor.random(alpha: 0.1).alpha, 0.1, accuracy: 0.1)
    }
    
    func testGrayscaleComponents() {
        let components_0 = UIColor.systemRed.grayscaleComponents
        XCTAssertEqual(components_0.white, 0.54, accuracy: 0.01)
        XCTAssertEqual(components_0.alpha, 1, accuracy: 0.01)
        XCTAssertEqual(components_0.description, "GrayscaleComponents(white: \(components_0.white), alpha: \(components_0.alpha))")
        XCTAssertEqual(components_0.debugDescription, components_0.description)
        
        let components_1 = UIColor.gray.withAlphaComponent(0.75).grayscaleComponents
        XCTAssertEqual(components_1.white, 0.5, accuracy: 0.01)
        XCTAssertEqual(components_1.alpha, 0.75, accuracy: 0.01)
        XCTAssertEqual(components_1.description, "GrayscaleComponents(white: \(components_1.white), alpha: \(components_1.alpha))")
        XCTAssertEqual(components_1.debugDescription, components_1.description)
    }
 
    func testRGBAComponents() {
        let components = UIColor.systemRed.rgbaComponents
        XCTAssertEqual(components.red, 1, accuracy: 0.01)
        XCTAssertEqual(components.green, 0.23, accuracy: 0.01)
        XCTAssertEqual(components.blue, 0.18, accuracy: 0.01)
        XCTAssertEqual(components.alpha, 1, accuracy: 0.01)
        
        XCTAssertEqual(UIColor(components: components).rgbaComponents, components)
        
        XCTAssertEqual(components.description, "RGBAComponents(red: \(components.red), green: \(components.green), blue: \(components.blue), alpha: \(components.alpha))")
        XCTAssertEqual(components.debugDescription, components.description)
    }
    
    func testRGBA255Components() {
        let components = UIColor.systemRed.rgba255Components
        XCTAssertEqual(components.red, 255)
        XCTAssertEqual(components.green, 59)
        XCTAssertEqual(components.blue, 48)
        XCTAssertEqual(components.alpha, 1)
        
        XCTAssertEqual(UIColor(components: components).rgba255Components, components)
        XCTAssertEqual(UIColor(red: 255, green: 59, blue: 48, alpha: 1).rgba255Components, components)
        
        XCTAssertEqual(components.description, "RGBA255Components(red: \(components.red), green: \(components.green), blue: \(components.blue), alpha: \(components.alpha))")
        XCTAssertEqual(components.debugDescription, components.description)
    }
    
    func testHSBAComponents() {
        let components = UIColor.systemRed.hsbaComponents
        XCTAssertEqual(components.hue, 0.0088, accuracy: 0.0001)
        XCTAssertEqual(components.saturation, 0.81, accuracy: 0.01)
        XCTAssertEqual(components.brightness, 1, accuracy: 0.01)
        XCTAssertEqual(components.alpha, 1, accuracy: 0.01)
        
        XCTAssertEqual(UIColor(components: components).hsbaComponents, components)
        
        XCTAssertEqual(components.description, "HSBAComponents(hue: \(components.hue), saturation: \(components.saturation), brightness: \(components.brightness), alpha: \(components.alpha))")
        XCTAssertEqual(components.debugDescription, components.description)
    }
    
    func testHexComponents() {
        XCTAssertEqual(UIColor.systemRed.hexValue(), 0xFF3B30)
        XCTAssertEqual(UIColor.systemRed.hexValue(includeAlpha: true), 0xFFFF3B30)
        
        XCTAssertEqual(UIColor.systemRed.hexString(), "#FF3B30")
        XCTAssertEqual(UIColor.systemRed.hexString(includeAlpha: true), "#FFFF3B30")
        XCTAssertEqual(UIColor.systemRed.hexString(allowsShort: true), "#FF3B30")
        XCTAssertEqual(UIColor.systemRed.hexString(includeAlpha: true, allowsShort: true), "#FFFF3B30")
        
        XCTAssertEqual(UIColor.red.hexString(), "#FF0000")
        XCTAssertEqual(UIColor.red.hexString(includeAlpha: true), "#FFFF0000")
        XCTAssertEqual(UIColor.red.hexString(allowsShort: true), "#F00")
        XCTAssertEqual(UIColor.red.hexString(includeAlpha: true, allowsShort: true), "#FF00")
        
        XCTAssertEqual(UIColor(hex: 0xFF3B30).hexString(), "#FF3B30")
        XCTAssertEqual(UIColor(argb: 0xFFFF3B30).hexString(includeAlpha: true), "#FFFF3B30")
        
        XCTAssertEqual(UIColor(hexString: "0xFF3B30")?.hexString(), "#FF3B30")
        XCTAssertEqual(UIColor(hexString: "FF3B30")?.hexString(), "#FF3B30")
        XCTAssertEqual(UIColor(hexString: "#FF3B30")?.hexString(), "#FF3B30")
        
        XCTAssertEqual(UIColor(hexString: "0xFFFF3B30")?.hexString(includeAlpha: true), "#FFFF3B30")
        XCTAssertEqual(UIColor(hexString: "FFFF3B30")?.hexString(includeAlpha: true), "#FFFF3B30")
        XCTAssertEqual(UIColor(hexString: "#FFFF3B30")?.hexString(includeAlpha: true), "#FFFF3B30")
        
        XCTAssertEqual(UIColor(hexString: "0xF00")?.hexString(allowsShort: true), "#F00")
        XCTAssertEqual(UIColor(hexString: "0xF00")?.hexString(includeAlpha: true, allowsShort: true), "#FF00")
        
        XCTAssertEqual(UIColor(hexString: "F00")?.hexString(allowsShort: true), "#F00")
        XCTAssertEqual(UIColor(hexString: "F00")?.hexString(includeAlpha: true, allowsShort: true), "#FF00")
        
        XCTAssertEqual(UIColor(hexString: "#F00")?.hexString(allowsShort: true), "#F00")
        XCTAssertEqual(UIColor(hexString: "#F00")?.hexString(includeAlpha: true, allowsShort: true), "#FF00")
        
        XCTAssertNil(UIColor(hexString: "Hello world!"))
    }
    
}
