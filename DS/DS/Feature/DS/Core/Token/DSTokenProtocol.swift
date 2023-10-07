protocol DSTokenProtocol {
    associatedtype Variant
    associatedtype Component
    static func applyToken(_ component: Component, variant: Variant)
}
