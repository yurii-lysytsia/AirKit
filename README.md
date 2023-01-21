# 🍃 AirKit
> Many extensions to speed up your coding time!

![Languages](https://img.shields.io/github/languages/top/yurii-lysytsia/AirKit?color=orange)
![Platforms](https://img.shields.io/cocoapods/p/AirKit)
![CocoaPods](https://img.shields.io/cocoapods/v/AirKit?color=red)
![GitHub](https://img.shields.io/github/actions/workflow/status/yurii-lysytsia/AirKit/on-pull-request.yml)

This is sugar framework that contains many different extensions for native Swift and iOS frameworks

- [Features](#-features)
- [Installation](#-installation)
    - [CocoaPods](#cocoapods)
- [Usage](#-usage)
- [Documentation](#-documentation)
- [License](#-license)

## 🔮 Features
**AirKit** is a modular framework, so this is easy to use only the needed module.

### Extensions for [`Swift`](AirKit/Swift)
- [X] Extensions for primitive values (`Bool`, `Int`, `Double`, `String`, etc.);
- [X] Extensions for collections (`Sequence`, `Collections`, etc.);
- [X] Extensions for `Comparable`;
- [X] Extensions for `Optional`;
- [X] Extensions for `Result`;
- [X] Extensions for `Codable` and `KeyedDecodingContainer`;
- [X] Extensions for `KeyPath`;
- [X] Extensions for `Mirror`;
- [X] `Once` - class than manages only one execution block of code;

### Extensions for [`Foundation`](AirKit/Foundation)
- [X] Extensions for `NSAttributedString`;
- [X] Extensions for `Calendar`, `Date`, `DateFormatter`, `TimeInterval` and `TimeZone`;
- [X] Extensions for `URL`, `URLComponents` and `URLRequest`;
- [X] Extensions for `UserDefaults` and `FileManagers`;
- [X] Extensions for `NumberFormatter`;
- [X] Extensions for `Data`;
- [X] Extensions for `Bundle`;
- [X] Extensions for `Locale`;
- [X] Extensions for `DispatchQueue`;
- [X] `Swizzle` - suggar for use ObjC swizzle methods;

### Extensions for [`QuartzCore`](AirKit/QuartzCore)
- [X] Extensions for `CACornerMask`;
- [X] Extensions for `CAGradientLayer`;
- [X] Extensions for `CATransform3D`;
- [X] Extensions for `CAMediaTimingFunction`;
- [X] Extensions for `CGFloat`;
- [X] Extensions for `CGPoint`;
- [X] Extensions for `CGSize`;
- [X] Extensions for `CGColor`;

### Extensions for [`CoreImage`](AirKit/CoreImage)
- [X] Extensions for `CIContext`;
- [X] Extensions for `CIFilter`;

### Extensions for [`CoreLocation`](AirKit/CoreLocation)
- [X] Extensions for `CLLocation`;
- [X] Extensions for `CLLocationCoordinate2D`;

### Extensions for [`UIKit`](AirKit/UIKit)
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

### Extensions for [`MapKit`](AirKit/MapKit)
- [X] Extensions for `MKMapView`;
- [X] Extensions for `MKPolyline`;

### Extensions for [`WebKit`](AirKit/WebKit)
- [X] Extensions for `WKWebView`;

### Extensions for [`LocalAuthentication`](AirKit/LocalAuthentication)
- [X] Extensions for `LAContext`;

### Extensions for [`CoreData`](AirKit/CoreData)
- [ ] Extensions for `NSPredicate`;
- [ ] Extensions for `NSManagedObject`;

### Extensions for [`Combine`](AirKit/Combine)
- [X] Extensions for `TopLevelDecoder`;
- [X] Added `-Relay` alias for `Subject` with `Never` failure type;

### v 0.9 | Extensions for [`CoreImage`](AirKit/Source/CoreImage)
- [ ] `CICategory` (https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference);

### v 1.X | Helpers
- Add Logger extensions;
- Actions blocks instead target for different UI elements, like button actions with blocks (including Combine);
- Closures for different components with old target (simple version of https://github.com/vhesener/Closures);
- Then, like https://github.com/devxoul/Then;
- Extensions for keyboard observing with many helpers;
- Extensions for change screen on multitasking;
- Extensions for `UIApplication` to open schemes, such as `mailto` or popular apps;
- Nibless view;
- Anything else?

## 🚀 Installation

### [CocoaPods](https://cocoapods.org) 
For usage and installation instructions, visit their website. To integrate AirKit into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
# Import all modules. This import includes all "Root" modules. See details bellow
pod 'AirKit', '~> 0.8'

# Import one or many specific module(s)
## Core (without UI elements)
pod 'AirKit/Swift', '~> 0.8'
pod 'AirKit/Foundation', '~> 0.8'
pod 'AirKit/Combine', '~> 0.8'

## CoreUI (including UI elements)
pod 'AirKit/QuartzCore', '~> 0.8'
pod 'AirKit/CoreImage', '~> 0.8'
pod 'AirKit/UIKit', '~> 0.8'
pod 'AirKit/WebKit', '~> 0.8'

# Other (specific frameworks to the project)
pod 'AirKit/CoreLocation', '~> 0.8'
pod 'AirKit/MapKit', '~> 0.8'
pod 'AirKit/LocalAuthentication', '~> 0.8'
```

## 💻 Usage 

### Import `AirKit` to the file and use extensions that you need.
```swift
import AirKit
```
Don't worry to import `AirKit` in any file because `AirKit` is import-safety. What does it mean? When you import `AirKit` to your file it includes only selected modules without any other imports. For example,
```swift
import AirKit

final class ViewModel {
    let image: UIImage // 🔴 Cannot find 'UIImage' in scope | It happenes because to use "UIImage", you need to import "UIKit"
    let url: URL // 🔴 Cannot find 'URL' in scope | It happenes because to use "URL", you need to import "Foundation"
    let version: Version // Works because "Version" is a model from "AirKit"
}
```

## 📚 Documentation
Documentation will be available soon. But now it available only for all extensions methods and properties summary.

## 📜 License
Released under the MIT license. See [LICENSE](LICENSE) for details.
