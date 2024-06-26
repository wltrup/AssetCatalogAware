# AssetCatalogAware
![](https://img.shields.io/badge/platforms-iOS%2013%20%7C%20tvOS%2013%20%7C%20watchOS%206-red)
[![Xcode](https://img.shields.io/badge/Xcode-11-blueviolet.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.1-orange.svg)](https://swift.org)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wltrup/AssetCatalogAware)
![GitHub](https://img.shields.io/github/license/wltrup/AssetCatalogAware)

## What

**AssetCatalogAware** is a Swift Package Manager package for iOS/tvOS (13.0 and above) and watchOS (6.0 and above) defining protocols and functions to access Strings, SwiftUI Fonts, System Images, non-system Images, and Colors, all in a type-safe manner. If you need to support iOS/tvOS versions below 13.0 and/or watchOS versions below 6.0, you might want to look at [AssetCatalogAwarePre13](https://github.com/wltrup/AssetCatalogAwarePre13), instead.

An actual practical use of **AssetCatalogAware** is my [**Assets**](https://github.com/wltrup/Assets) framework, which also provides example projects for both UIKit and SwiftUI.

To get a sense of how **AssetCatalogAware** works, here are the protocols and some of the functions it defines for accessing Colors. The other assets are accessed in a completely similar fashion:

- Protocols:

```swift
public protocol ColorIdentifier {
    var colorName: String { get }
}

public protocol ColorCatalogAware {
    associatedtype ColorId: ColorIdentifier
}
```

- Functions:

```swift
public extension ColorCatalogAware {

    func color(
        _ id: ColorId,
        in bundle: Bundle,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIColor

    func color(_ id: ColorId, in bundle: Bundle) -> Color

}
```

Thus, any type that conforms to `ColorCatalogAware` is able to access a color simply by referring to its color identifier, an instance of a concrete type that implements the `ColorIdentifier` protocol. Typically, concrete types conforming to `ColorIdentifier` are enumerations and concrete types conforming to `ColorCatalogAware` are UIKit views and/or view controllers, and SwiftUI views.

You may have noticed that these functions take a `Bundle` argument. This is useful when you want to have assets in test targets, for example, but it is a bit of a nuisance to have to keep passing that argument. Sure, you could create your own versions of these functions that take a pre-defined bundle as a default but, fret not, you're covered there too. If you have a type that conforms to

```swift
public protocol AssetCatalogProvider {
    var catalogBundleClass: AnyClass { get }
}
```
then a protocol extension defined in **AssetCatalogAware** will automatically pass the correct bundle to any function that requires one. Take a look at the [**Assets**](https://github.com/wltrup/Assets) framework to see this in action.


## Installation

**AssetCatalogAware** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## License

**AssetCatalogAware** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
