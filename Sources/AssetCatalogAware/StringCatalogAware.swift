import Foundation

public protocol StringIdentifier: RawRepresentable where Self.RawValue == String {}

public protocol StringCatalogAware {
    associatedtype StringId: StringIdentifier
}

public extension StringCatalogAware {

    static func string(_ id: StringId) -> String {
        id.rawValue
    }

}
