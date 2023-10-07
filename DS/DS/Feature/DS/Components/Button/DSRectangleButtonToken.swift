import UIKit
final class DSRectangleButtonToken: DSTokenProtocol {
    
    typealias Variant = DSButtonToken.RectangleVariant
    typealias Component = DSButton
    
    static func applyToken(_ component: DSButton, variant: DSButtonToken.RectangleVariant) {
        switch variant {
        case .rounded(let variant):
            setup(component, variant: variant)
        }
    }
    
    static func setup(_ component: DSButton, variant: DSButtonToken.OptionVariant) {
        switch variant {
        case .default(let style):
            setupStyle(component, style: style)
        case .boadered(let boarder):
            setupBoarder(component, boader: boarder)
        }
    }
    
    static func setupStyle(_ component: DSButton, style: DSButtonToken.Style) {
        let titleColor: UIColor
        
        switch style {
        case .neutral(let size):
            setup(component, size: size)
            titleColor = .clear
        case .primary(let size):
            component.backgroundColor = .clear
            titleColor = DSColorTokens.ds_color_primary_onLightMode.value
            setup(component, size: size)
        case .secundary(let size):
            component.backgroundColor = .clear
            titleColor = DSColorTokens.ds_color_secundary_onLightMode.value
            setup(component, size: size)
        }
        
        component.setTitleColor(titleColor, for: .normal)
    }
    
    static func setupBoarder(_ component: DSButton, boader: DSButtonToken.Boarder) {
        switch boader {
        case .fine(let style):
            setupStyle(component, style: style)
        }
    }
    
    static func setup(_ component: DSButton, size tokenSize: DSButtonToken.Size) {
        
        let geo: DSButtonToken.Geometry
        let size: DSSpacingTokens
        
        switch tokenSize {
        case .none(let geometry):
            size = .ds_spacing_none
            geo = geometry
            
        case .micro(let geometry):
            size = .ds_spacing_micro
            geo = geometry
            
        case .tiny(let geometry):
            size = .ds_spacing_tiny
            geo = geometry
            
        case .xxSmall(let geometry):
            size = .ds_spacing_xxSmall
            geo = geometry
            
        case .xSmall(let geometry):
            size = .ds_spacing_xSmall
            geo = geometry
            
        case .small(let geometry):
            size = .ds_spacing_small
            geo = geometry
            
        case .medium(let geometry):
            size = .ds_spacing_medium
            geo = geometry
            
        case .large(let geometry):
            size = .ds_spacing_large
            geo = geometry
            
        case .xLarge(let geometry):
            size = .ds_spacing_xLarge
            geo = geometry
            
        case .xxLarge(let geometry):
            size = .ds_spacing_xxLarge
            geo = geometry
        }
        
        let height: CGFloat
        let width: CGFloat
        switch geo {
        case .circle:
            height = size.value
            width = size.value
        case .rectangle:
            height = size.value
            width = 3 * size.value
        case .square:
            height = size.value
            width = size.value
        }
        
        component.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            component.heightAnchor.constraint(equalToConstant: height),
            component.widthAnchor.constraint(equalToConstant: width),
        ])
    }
}
