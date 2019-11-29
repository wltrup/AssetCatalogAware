import UIKit

#if canImport(SwiftUI)
    import SwiftUI
#endif

public protocol ImageIdentifier {
    var imageName: String { get }
}

public extension ImageIdentifier where Self: RawRepresentable, Self.RawValue == String {
    var imageName: String { self.rawValue }
}

public protocol ImageCatalogAware {
    associatedtype ImageId: ImageIdentifier
}

public extension ImageCatalogAware where Self: AssetCatalogStaticApiProvider {

    static func image(
        _ id: ImageId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        Self().image(id, compatibleWith: traitCollection)
    }

    @available(iOS 13.0, *)
    static func image(
        _ id: ImageId,
        withConfiguration configuration: UIImage.Configuration
    ) -> UIImage {
        Self().image(id, withConfiguration: configuration)
    }

    #if canImport(SwiftUI)
        @available(iOS 13.0, *)
        static func image(_ id: ImageId, label: Text) -> Image {
            Self().image(id, label: label)
        }

        @available(iOS 13.0, *)
        static func image(_ id: ImageId) -> Image {
            Self().image(id)
        }
    #endif

}

public extension ImageCatalogAware where Self: AssetCatalogProvider {

    func image(
        _ id: ImageId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        image(id, in: self.catalogBundle, compatibleWith: traitCollection)
    }

    @available(iOS 13.0, *)
    func image(
        _ id: ImageId,
        withConfiguration configuration: UIImage.Configuration
    ) -> UIImage {
        image(id, in: self.catalogBundle, withConfiguration: configuration)
    }

    #if canImport(SwiftUI)
        @available(iOS 13.0, *)
        func image(_ id: ImageId, label: Text) -> Image {
            image(id, in: self.catalogBundle, label: label)
        }

        @available(iOS 13.0, *)
        func image(_ id: ImageId) -> Image {
            image(id, in: self.catalogBundle)
        }
    #endif

}

public extension ImageCatalogAware {

    func image(
        _ id: ImageId,
        in bundle: Bundle,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        guard let image = UIImage(named: id.imageName, in: bundle, compatibleWith: traitCollection) else {
            fatalError(
                "Could not load image named '\(id.imageName)' " +
                "from bundle '\(bundle)' " +
                "compatible with trait collection '\(String(describing: traitCollection))' " +
                "for image id '\(id)'"
            )
        }
        return image
    }

    @available(iOS 13.0, *)
    func image(
        _ id: ImageId,
        in bundle: Bundle,
        withConfiguration configuration: UIImage.Configuration
    ) -> UIImage {
        guard let image = UIImage(named: id.imageName, in: bundle, with: configuration) else {
            fatalError(
                "Could not load image named '\(id.imageName)' " +
                "from bundle '\(bundle)' " +
                "with image configuration '\(String(describing: configuration))' " +
                "for image id '\(id)'"
            )
        }
        return image
    }

    #if canImport(SwiftUI)
        @available(iOS 13.0, *)
        func image(_ id: ImageId, in bundle: Bundle, label: Text) -> Image {
            Image(id.imageName, bundle: bundle, label: label)
        }

        @available(iOS 13.0, *)
        func image(_ id: ImageId, in bundle: Bundle) -> Image {
            Image(id.imageName, bundle: bundle)
        }
    #endif

}
