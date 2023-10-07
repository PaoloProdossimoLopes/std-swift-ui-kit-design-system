import Foundation

final class DSButtonToken: DSTokenProtocol {
    
    typealias Variant = Options
    typealias Component = DSButton
    
    enum Options {
        case square(SquareVariant)
        case rectangle(RectangleVariant)
        case circle(OptionVariant)
    }
    
    static func applyToken(_ component: DSButton, variant: Options) {
        switch variant {
        case .circle(let variant):
            break
        case .rectangle(let recVariant):
            DSRectangleButtonToken.applyToken(component, variant: recVariant)
        case .square(let squaVariant):
            break
        }
    }
}
