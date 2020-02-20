# AssetCatalogAware

## What

**AssetCatalogAware** is a Swift Package Manager package for iOS versions 13.0 and above, defining protocols and functions to access Strings, SwiftUI Fonts, System Images, non-system Images, and Colors, all in a type-safe manner. If you need to support iOS versions below 13.0, you might want to look at [AssetCatalogAwarePre13](https://github.com/wltrup/AssetCatalogAwarePre13), instead.

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

## Installation

**AssetCatalogAware** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## Author

Wagner Truppel, trupwl@gmail.com

## License

**AssetCatalogAware** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
