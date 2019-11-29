import Foundation

public protocol VoidInitializable {
    init()
}

public protocol AssetCatalogProvider {
    var catalogBundleClass: AnyClass { get }
}

public extension AssetCatalogProvider {

    var catalogBundle: Bundle {
        Bundle(for: self.catalogBundleClass)
    }

}

public protocol AssetCatalogStaticApiProvider: AssetCatalogProvider & VoidInitializable {}
