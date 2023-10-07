import UIKit

final class DSTextLabelToken: DSTokenProtocol {
    
    typealias Variant = DSTextToken.TextType.LabelVariant
    typealias Component = DSText
    
    private init() { /*Singleton*/ }
    
    static func applyToken(_ component: Component, variant: Variant) {
        switch variant {
        case .default(let style):
            setupStyle(component, style: style)
        case .onLightMode(let state):
            break
        case .onDarkMode(let state):
            break
        }
    }
    
    static func setupStyle(_ component: Component, style: Variant.Style) {
        switch style {
        case .neutral(let state):
            break
        case .primary(let state):
            break
        case .secondary(let state):
            break
        case .positive(let size):
            component.color = DSColorTokens.ds_color_primary_onLightMode.value
            setupSize(component, size: size)
        case .negative(let size):
            component.color = DSColorTokens.ds_color_secundary_onLightMode.value
            setupSize(component, size: size)
        }
    }
    
    static func setupSize(_ component: Component, size: Variant.Size) {
        
        let tokenTextFont: DSFontTokens
        let tokenTextFontSize: DSFontSizeTokens
        let textWeight: Variant.Weight
        
        switch size {
        case .none(let weight):
            tokenTextFontSize = .ds_fontSize_none
            textWeight = weight
        case .micro(let weight):
            tokenTextFontSize = .ds_fontSize_micro
            textWeight = weight
        case .tiny(let weight):
            tokenTextFontSize = .ds_fontSize_tiny
            textWeight = weight
        case .xxSmall(let weight):
            tokenTextFontSize = .ds_fontSize_xxSmall
            textWeight = weight
        case .xSmall(let weight):
            tokenTextFontSize = .ds_fontSize_xSmall
            textWeight = weight
        case .small(let weight):
            tokenTextFontSize = .ds_fontSize_small
            textWeight = weight
        case .medium(let weight):
            tokenTextFontSize = .ds_fontSize_medium
            textWeight = weight
        case .large(let weight):
            tokenTextFontSize = .ds_fontSize_large
            textWeight = weight
        case .xLarge(let weight):
            tokenTextFontSize = .ds_fontSize_xLarge
            textWeight = weight
        case .xxLarge(let weight):
            tokenTextFontSize = .ds_fontSize_xxLarge
            textWeight = weight
        }
        
        switch textWeight {
        case .thin:
            tokenTextFont = .ds_font_thin
        case .light:
            tokenTextFont = .ds_font_light
        case .regular:
            tokenTextFont = .ds_font_regular
        case .medium:
            tokenTextFont = .ds_font_medium
        case .demibold:
            tokenTextFont = .ds_font_demibold
        case .bold:
            tokenTextFont = .ds_font_bold
        case .black:
            tokenTextFont = .ds_font_black
        case .heavy:
            tokenTextFont = .ds_font_heavy
        }
        
        let size = tokenTextFontSize.value
        let font = tokenTextFont.value
        component.textFont = UIFont(name: font, size: size)
    }
}
