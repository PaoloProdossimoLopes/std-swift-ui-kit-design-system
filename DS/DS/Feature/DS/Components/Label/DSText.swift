import UIKit

final class DSText: UILabel {
    
    //MARK: - Properties
    var color: UIColor? {
        didSet { textColor = color }
    }
    
    var textFont: UIFont? {
        didSet { font = textFont }
    }
    
    var type: DSTextToken.TextType {
        didSet { applyTokens() }
    }
    
    //MARK: - Constructor
    init(type: DSTextToken.TextType) {
        self.type = type
        super.init(frame: .zero)
        setup()
    }
    
    override init(frame: CGRect) {
        typealias LVariant = DSTextToken.TextType.LabelVariant
        let weight: LVariant.Weight = .bold
        let size: LVariant.Size = .tiny(weight)
        let state: LVariant.State = .base(size)
        let style: LVariant.Style = .primary(state)
        let variant: LVariant = .default(style)
        let t: DSTextToken.TextType = .label(variant)
        self.type = t
        super.init(frame: frame)
        setup()
    }
    
    init(config: Configurator) {
        self.type = config.config
        super.init(frame: .zero)
        setup()
    }
    
    struct Configurator {
        typealias LVariant = DSTextToken.TextType.LabelVariant
        
        let option: Options
        enum Options {
            case label
        }
        
        let variant: Variant
        enum Variant {
            case `default`
        }
        
        let style: Style
        enum Style {
            case neutral
            case primary
            case secondary
            
            case positive
            case negative
        }
        
        let state: State
        enum State {
            case base
            case variant
            case disable
            case error
        }
        
        let size: Size
        enum Size {
            case none
            case micro
            case tiny
            case xxSmall
            case xSmall
            case small
            case medium
            case large
            case xLarge
            case xxLarge
        }
        
        let weight: Weight
        enum Weight {
            case thin
            case light
            case regular
            case medium
            case demibold
            case bold
            case black
            case heavy
        }
        
        var config: DSTextToken.TextType {
            let weight: LVariant.Weight = weightManager()
            let size: LVariant.Size = sizeManager(weight: weight)
            let state: LVariant.State = stateManager(size: size)
            let style: LVariant.Style = styleManager(state: state, size: size)
            let variant: LVariant = variantManager(style: style)
            let type: DSTextToken.TextType = optionManager(variant: variant)
            return type
        }
        
        private func optionManager(variant: LVariant) -> DSTextToken.TextType {
            switch option {
            case .label:
                return .label(variant)
            }
        }
        
        private func variantManager(style: LVariant.Style) -> LVariant {
            switch variant {
            case .default:
                return .default(style)
            }
        }
        
        private func styleManager(state: LVariant.State, size:LVariant.Size) -> LVariant.Style {
            switch style {
            case .neutral:
                return .neutral(state)
            case .primary:
                return .primary(state)
            case .secondary:
                return .secondary(state)
            case .positive:
                return .positive(size)
            case .negative:
                return .negative(size)
            }
        }
        
        private func stateManager(size: LVariant.Size) -> LVariant.State {
            switch state {
            case .base:
                return .base(size)
            case .variant:
                return .variant(size)
            case .disable:
                return .disable(size)
            case .error:
                return .error(size)
            }
        }
        
        private func sizeManager(weight: LVariant.Weight) -> LVariant.Size {
            switch size {
            case .none:
                return .none(weight)
            case .micro:
                return .micro(weight)
            case .tiny:
                return .tiny(weight)
            case .xxSmall:
                return .xxSmall(weight)
            case .xSmall:
                return .xSmall(weight)
            case .small:
                return .small(weight)
            case .medium:
                return .medium(weight)
            case .large:
                return .large(weight)
            case .xLarge:
                return .xLarge(weight)
            case .xxLarge:
                return .xxLarge(weight)
            }
        }
        
        private func weightManager() -> LVariant.Weight {
            switch weight {
            case .thin:
                return .thin
            case .light:
                return .light
            case .regular:
                return .regular
            case .medium:
                return .medium
            case .demibold:
                return .demibold
            case .bold:
                return .bold
            case .black:
                return .black
            case .heavy:
                return .heavy
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func setup() {
        applyTokens()
    }
    
    private func applyTokens() {
        DSTextToken.applyToken(self, variant: type)
    }
}
