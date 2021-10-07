# 🍃 AirKit
> Many extensions to speed up your coding time!

[![Languages](https://img.shields.io/github/languages/top/yurii-lysytsia/AirKit?color=orange)]()
[![Platforms](https://img.shields.io/cocoapods/p/AirKit)]()
[![CocoaPods](https://img.shields.io/cocoapods/v/AirKit?color=red)]()
[![Build](https://img.shields.io/github/workflow/status/yurii-lysytsia/AirKit/Prepare%20to%20deploy)]()

This is sugar framework that contains many different extensions for native Swift and iOS frameworks

- [Features](#-features)
- [Installation](#-installation)
    - [CocoaPods](#cocoapods)
- [Usage](#-usage)
- [Documentation](#-documentation)
- [License](#-license)

## 🔮 Features

### Extensions for [`Swift language`](AirKit/Source/Swift)
- [X] Extensions for primitive values (`Bool`, `Int`, `Double`, `String`, etc.);
- [X] Extensions for collections (`Sequence`, `Collections`, etc.);
- [X] Extensions for `Comparable`;
- [X] Extensions for `Optional`;
- [X] Extensions for `Result`;
- [X] Extensions for `Codable` and `KeyedDecodingContainer`;
- [X] Extensions for `KeyPath`;
- [X] `Once` - class than manages only one execution block of code;

### Extensions for [`Foundation`](AirKit/Source/Foundation)
- [X] Extensions for `NSAttributedString`;
- [X] Extensions for `Calendar`, `Date`, `DateFormatter` and `TimeInterval`;
- [X] Extensions for `URL`, `URLComponents` and `URLRequest`;
- [X] Extensions for `UserDefaults` and `FileManagers`;
- [X] Extensions for `NumberFormatter`;
- [X] Extensions for `Data`;
- [X] Extensions for `Bundle`;
- [X] Extensions for `Locale`;
- [X] Extensions for `DispatchQueue`;

### Extensions for [`CoreGraphics`](AirKit/Source/CoreGraphics)
- [X] Extensions for `CGFloat`;
- [X] Extensions for `CGPoint`;
- [X] Extensions for `CGSize`;
- [X] Extensions for `CGColor`;

### Extensions for [`CoreAnimation`](AirKit/Source/CoreAnimation)
- [X] Extensions for `CACornerMask`;
- [X] Extensions for `CAGradientLayer`;
- [X] Extensions for `CATransform3D`;

### Extensions for [`CoreLocation`](AirKit/Source/CoreLocation)
- [X] Extensions for `CLLocation`;
- [X] Extensions for `CLLocationCoordinate2D`;

### Extensions for [`UIKit`](AirKit/Source/UIKit)
- [X] Extensions for `UIGraphicsImageRenderer`, `UIGraphicsImageRendererFormat` and `UIImage`;
- [X] Extensions for `UIColor`;
- [X] Extensions for `UIEdgeInsets`;
- [X] Extensions for `UIBezierPath`;
- [X] Extensions for `UILayoutPriority`;
- [X] Extensions for `UIView`;
- [ ] Extensions for `UIStackView`;
- [ ] Extensions for `UIButton`;
- [ ] Extensions for `UIImageView`;
- [ ] Extensions for `UILabel`;
- [ ] Extensions for `UISegmentedControl`;
- [ ] Extensions for `UISlider`;
- [ ] Extensions for `UISwitch`;

### v 0.5 | Extensions for `UIKit` (Part 2)
- [ ] Extensions for different `UIView` elements (will write about it later);
- [ ] Extensions for different `UIScrollView` elements (will write about it later);

### v 0.6 | Extensions for `UIKit` (Part 3)
- [ ] Extensions for different `UIViewController` subclasses (will write about it later);

### v 0.7 | Extensions for `UIKit` (Part 4)
- [ ] Extensions for `UIWindow`;
- [ ] Extensions for `UIApplication`;
- [ ] Extensions for keyboard observing with many helpers;
- [ ] Extensions for change screen on multitasking;

### v 0.8 | Extensions for `CoreData`
- [ ] Extensions for `NSPredicate`;
- [ ] Extensions for `NSManagedObject`;

### v 0.9 | Extensions for `MapKit`
- [ ] Extensions for `MKMapView`;
- [ ] Extensions for `MKPolyline`;

### v 1.0 | Extension for Other native frameworks
- [ ] Extensions for `WKWebView`;
- [ ] Extensions for `LocalAuthentication` (`LAContext` etc.);

### v 1.1 | Extensions for `Combine`
- [X] Extensions for `TopLevelDecoder`;

### v 1.2 | Helpers
- [ ] Common blocks typealias to convinient usage;
- [ ] Actions blocks instead target for different UI elements, like button actions with blocks;
- [ ] Closures for different components with old target (simple version of https://github.com/vhesener/Closures);
- [ ] Multicast delegate (model which can collect multiple delegate);
- [ ] Convenience swizzling methods;
- [ ] AsyncOperationQueue (model bases on `OperationsQueue` and `DispatchSemaphore` to make it async and sireal)
- [ ] Then, like https://github.com/devxoul/Then;
- [ ] Extensions for `UIView` and `NSLayoutConstraint`;

### v 1.3 | Extensions for  [`CoreImage`](AirKit/Source/CoreImage)
- [X] Extensions for `CIContext`;
- [X] Extensions for `CIFilter`;
- [ ] `CICategory` (https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference);

## 🚀 Installation

### [CocoaPods](https://cocoapods.org) 
For usage and installation instructions, visit their website. To integrate AirKit into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'AirKit', '~> 0.5'
```

## 💻 Usage 

### 1. Swizzle (not mandatory)
Some features of `AirKit` are needed of method swizzling. So you can use code below to swizzle easily.

```swift
import AirKit

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ...
    do {
        try AirKit.swizzle()
    } catch {
        // Catch some error of `AirKit` swizzling if needed.
        // You can use `try? AirKit.swizzle()` if you don't need catch error
    }
    ...
}
```

### 2. Import `AirKit` to the file and use extensions that you need.
```swift
import AirKit
```

## 📚 Documentation
Documentation will be available soon. But now it available only for all extensions methods and properties summary.

## 📜 License
Released under the MIT license. See [LICENSE](LICENSE) for details.
