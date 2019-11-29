import UIKit

#if canImport(SwiftUI)
    import SwiftUI
#endif

@available(iOS 11.0, *)
public protocol ColorIdentifier {
    var colorName: String { get }
}

@available(iOS 11.0, *)
public extension ColorIdentifier where Self: RawRepresentable, Self.RawValue == String {
    var colorName: String { self.rawValue }
}

@available(iOS 11.0, *)
public protocol ColorCatalogAware {
    associatedtype ColorId: ColorIdentifier
}

@available(iOS 11.0, *)
public extension ColorCatalogAware where Self: AssetCatalogStaticApiProvider {

    static func color(
        _ id: ColorId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIColor {
        Self().color(id, compatibleWith: traitCollection)
    }

    #if canImport(SwiftUI)
        @available(iOS 13.0, *)
        static func color(_ id: ColorId) -> Color {
            Self().color(id)
        }
    #endif

}

@available(iOS 11.0, *)
public extension ColorCatalogAware where Self: AssetCatalogProvider {

    func color(
        _ id: ColorId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIColor {
        color(id, in: self.catalogBundle, compatibleWith: traitCollection)
    }

    #if canImport(SwiftUI)
        @available(iOS 13.0, *)
        func color(_ id: ColorId) -> Color {
            color(id, in: self.catalogBundle)
        }
    #endif

}

@available(iOS 11.0, *)
public extension ColorCatalogAware {

    func color(
        _ id: ColorId,
        in bundle: Bundle,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIColor {
        guard let color = UIColor(named: id.colorName, in: bundle, compatibleWith: traitCollection) else {
            fatalError(
                "Could not load color named '\(id.colorName)' " +
                "from bundle '\(bundle)' " +
                "compatible with trait collection '\(String(describing: traitCollection))' " +
                "for color id '\(id)'"
            )
        }
        return color
    }

    #if canImport(SwiftUI)
        @available(iOS 13.0, *)
        func color(_ id: ColorId, in bundle: Bundle) -> Color {
            Color(id.colorName, bundle: bundle)
        }
    #endif

}
