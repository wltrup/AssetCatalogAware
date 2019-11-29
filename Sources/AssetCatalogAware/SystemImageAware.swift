import UIKit

#if canImport(SwiftUI)
    import SwiftUI
#endif

@available(iOS 13.0, *)
public protocol SystemImageIdentifier {
    var systemImageName: String { get }
}

@available(iOS 13.0, *)
public extension SystemImageIdentifier where Self: RawRepresentable, Self.RawValue == String {
    var systemImageName: String { self.rawValue }
}

@available(iOS 13.0, *)
public protocol SystemImageCatalogAware {
    associatedtype SystemImageId: SystemImageIdentifier
}

@available(iOS 13.0, *)
public extension SystemImageCatalogAware {

    static func systemImage(
        _ id: SystemImageId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        guard let image = UIImage(systemName: id.systemImageName, compatibleWith: traitCollection) else {
            fatalError(
                "Could not load system image named '\(id.systemImageName)' " +
                "compatible with trait collection '\(String(describing: traitCollection))' " +
                "for image id '\(id)'"
            )
        }
        return image
    }

    static func systemImage(
        _ id: SystemImageId,
        withConfiguration configuration: UIImage.Configuration
    ) -> UIImage {
        guard let image = UIImage(systemName: id.systemImageName, withConfiguration: configuration) else {
            fatalError(
                "Could not load system image named '\(id.systemImageName)' " +
                "with image configuration '\(String(describing: configuration))' " +
                "for image id '\(id)'"
            )
        }
        return image
    }

    #if canImport(SwiftUI)
        static func systemImage(_ id: SystemImageId) -> Image {
            Image(systemName: id.systemImageName)
        }
    #endif

}
