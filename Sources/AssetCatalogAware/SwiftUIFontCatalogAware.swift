#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
public protocol SwiftUIFontIdentifier {
    var font: Font? { get }
}

@available(iOS 13.0, *)
public protocol SwiftUIFontCatalogAware {
    associatedtype SwiftUIFontId: SwiftUIFontIdentifier
}

@available(iOS 13.0, *)
public extension SwiftUIFontCatalogAware {

    static func font(_ id: SwiftUIFontId) -> Font? {
        id.font
    }

}
#endif
