# 🍃 AirKit
> Many extensions to speed up your coding time!

[![Languages](https://img.shields.io/github/languages/top/yurii-lysytsia/AirKit?color=orange)]()
[![Platforms](https://img.shields.io/cocoapods/p/AirKit)]()
[![CocoaPods](https://img.shields.io/cocoapods/v/AirKit?color=red)]()
[![Build](https://img.shields.io/github/workflow/status/yurii-lysytsia/AirKit/Prepare%20to%20deploy)]()

This is sugar framework that contains many different extensions for native Swift and iOS frameworks

- [Features](#-features)
- [Installation](#-installation)
    - [CocoaPods](#CocoaPods)
- [Documentation](#-documentation)
- [License](#-license)

## 🔮 Features

### Extensions for `Swift language`
- [X] Extensions for primitive values (`Bool`, `Int`, `Double`, `String`, etc.);
- [X] Extensions for collections (`Sequence`, `Collections`, etc.);
- [X] Extensions for `Comparable`;
- [X] Extensions for `Optional`;
- [X] Extensions for `Result`;
- [X] Extensions for `Codable` and `KeyedDecodingContainer`;

### v 0.2 | Extensions for `Foundation`
- [X] Extensions for `NSAttributedString`;
- [X] Extensions for `Calendar`, `Date`, `DateFormatter` and `TimeInterval`;
- [X] Extensions for `Data`;
- [X] Extensions for `Bundle`;
- [X] Extensions for `Locale`;
- [ ] Extensions for formatters;
- [ ] Extensions for `FileManagers`;
- [ ] Extensions for `NSObject`;
- [ ] Extensions for `URL` and `URLRequest`;
- [ ] Extensions for `UserDefaults`;
- [ ] Extensions for `DispatchQueue` and `DispatchGroup`;
- [ ] Extensions for `Operations` and `OperationsQueue`;
- [ ] AsyncOperationQueue (model bases on `OperationsQueue` and `DispatchSemaphore` to make it async and sireal)
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version

### v 0.3 | Extensions for `CoreGraphics`
- [X] Extensions for `CGFloat`;
- [ ] Extensions for `CGAffineTransform`;
- [ ] Extensions for `CGColor`;
- [ ] Extensions for `CGPoint`;
- [ ] Extensions for `CGRect`;
- [ ] Extensions for `CGSize`;
- [ ] Extensions for `CGVector`;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 0.4 | Extensions for `CoreAnimation`
- [ ] Extensions for `CACornerMask`;
- [ ] Extensions for `CAGradientLayer`;
- [ ] Extensions for `CATransform3D`;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 0.5 | Extensions for `CoreData`
- [ ] Extensions for `NSPredicate`;
- [ ] Extensions for `NSManagedObject`;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 0.6 | Extensions for `CoreLocation`
- [ ] Extensions for `CLLocationCoordinate2D` and `CLLocation`;
- [ ] Extensions for `CLVisit`;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 0.7 | Extensions for `UIKit` (Part 1)
- [ ] Extensions for `UIImage`;
- [ ] Extensions for `UIColor`;
- [ ] Extensions for `UIEdgeInsets`;
- [ ] Extensions for `UIBezierPath`;
- [ ] Extensions for `UIFont`;
- [ ] Extensions for `UIGestureRecognizer`;
- [ ] Extensions for `UILayoutPriority`;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 0.8 | Extensions for `UIKit` (Part 2)
- [ ] Extensions for different `UIView` elements (will write about it later);
- [ ] Extensions for different `UIScrollView` elements (will write about it later);
- [ ] Actions blocks instead target for different UI elements, like button actions with blocks;
- [ ] Then, like https://github.com/devxoul/Then;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 0.9 | Extensions for `UIKit` (Part 3)
- [ ] Extensions for different `UIViewController` subclasses (will write about it later);
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 1.0 | Extensions for `UIKit` (Part 4)
- [ ] Extensions for `UIWindow`;
- [ ] Extensions for `UIApplication`;
- [ ] Extensions for keyboard observing with many helpers;
- [ ] Extensions for change screen on multitasking;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 1.1 | Extensions for `MapKit`
- [ ] Extensions for `MKMapView`;
- [ ] Extensions for `MKPolyline`;
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 1.2 | Extension for Other native frameworks
- [ ] Extensions for `WKWebView`;
- [ ] Extensions for `LocalAuthentication (LAContext etc.)
- [ ] Write documentation for all extensions of this version;
- [ ] Write unit tests to check all extensions of this version;

### v 1.3 | Extensions for `Combine`
- [X] Extensions for `TopLevelDecoder`;

### v 1.4 | Helpers
- [ ] Common blocks typealias to convinient usage (simple version of https://github.com/vhesener/Closures);
- [ ] Multicast delegate (model which can collect multiple delegate);
- [ ] Once (method wich is called once);

## 🚀 Installation

### CocoaPods 
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate AirKit into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'AirKit', '~> 0.2'
```

## 📚 Documentation
Documentation will be available soon. But now it available only for all extensions methods and properties summary.

## 📜 License
Released under the MIT license. See [LICENSE](LICENSE) for details.
