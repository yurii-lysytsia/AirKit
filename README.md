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
- [X] Extensions for `Mirror`;
- [X] `Once` - class than manages only one execution block of code;

### Extensions for [`Foundation`](AirKit/Source/Foundation)
- [X] Extensions for `NSAttributedString`;
- [X] Extensions for `Calendar`, `Date`, `DateFormatter`, `TimeInterval` and `TimeZone`;
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

### Extensions for [`CoreImage`](AirKit/Source/CoreImage)
- [X] Extensions for `CIContext`;
- [X] Extensions for `CIFilter`;

### Extensions for [`CoreAnimation`](AirKit/Source/CoreAnimation)
- [X] Extensions for `CACornerMask`;
- [X] Extensions for `CAGradientLayer`;
- [X] Extensions for `CATransform3D`;
- [X] Extensions for `CAMediaTimingFunction`;

### Extensions for [`CoreLocation`](AirKit/Source/CoreLocation)
- [X] Extensions for `CLLocation`;
- [X] Extensions for `CLLocationCoordinate2D`;

### Extensions for [`UIKit`](AirKit/Source/UIKit)
- [X] Extensions for `NSDirectionalEdgeInsets`;
- [X] Extensions for `UIGraphicsImageRenderer`, `UIGraphicsImageRendererFormat` and `UIImage`;
- [X] Extensions for `UIColor`;
- [X] Extensions for `UIEdgeInsets`;
- [X] Extensions for `UIBezierPath`;
- [X] Extensions for `UILayoutPriority`;
- [X] Extensions for `UIView`;
- [X] Extensions for `UIStackView`;
- [X] Extensions for `UIButton`;
- [X] Extensions for `UISwitch`;
- [X] Extensions for `UISearchBar`;
- [X] Extensions for `UIBarButtonItem`;
- [X] Extensions for `UITextView`;
- [X] Extensions for `UIScrollView`;
- [X] Extensions for `UICollectionView`;
- [X] Extensions for `UITableView`;
- [X] Extensions for `UINavigationViewController`;
- [X] Extensions for `UIPageViewController`;
- [X] Extensions for `UIViewController`;
- [X] Extensions for `UIWindow`;
- [X] Extensions for `UIApplication`;
- [X] Extensions for `UIFont`;

### Extensions for [`MapKit`](AirKit/Source/MapKit)
- [X] Extensions for `MKMapView`;
- [X] Extensions for `MKPolyline`;

### Extensions for [`WebKit`](AirKit/Source/WebKit)
- [X] Extensions for `WKWebView`;

### Extensions for [`LocalAuthentication`](AirKit/Source/LocalAuthentication)
- [X] Extensions for `LAContext`;

### Extensions for [`CoreData`](AirKit/Source/CoreData)
- [ ] Extensions for `NSPredicate`;
- [ ] Extensions for `NSManagedObject`;

### Extensions for `Combine`
- [X] Extensions for `TopLevelDecoder`;

### v 0.9 | Extensions for [`CoreImage`](AirKit/Source/CoreImage)
- [ ] `CICategory` (https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference);

### v 1.X | Helpers
- [ ] Common blocks typealias to convinient usage;
- [ ] Actions blocks instead target for different UI elements, like button actions with blocks;
- [ ] Closures for different components with old target (simple version of https://github.com/vhesener/Closures);
- [ ] Multicast delegate (model which can collect multiple delegate);
- [ ] Convenience swizzling methods;
- [ ] AsyncOperationQueue (model bases on `OperationsQueue` and `DispatchSemaphore` to make it async and sireal)
- [ ] Then, like https://github.com/devxoul/Then;
- [ ] Extensions for `UIView` and `NSLayoutConstraint`;
- [ ] Extensions for keyboard observing with many helpers;
- [ ] Extensions for change screen on multitasking;
- [ ] Extensions for `UIApplication` to open schemes, such as `mailto` or popular apps;
- [ ] Nibless view in the independent module 

## 🚀 Installation

### [CocoaPods](https://cocoapods.org) 
For usage and installation instructions, visit their website. To integrate AirKit into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'AirKit', '~> 0.7'
```

## 💻 Usage 

### Import `AirKit` to the file and use extensions that you need.
```swift
import AirKit
```

## 📚 Documentation
Documentation will be available soon. But now it available only for all extensions methods and properties summary.

## 📜 License
Released under the MIT license. See [LICENSE](LICENSE) for details.
