extension DSTextToken.TextType {
    enum LabelVariant {
        
        case `default`(Style)
        case onLightMode(State)
        case onDarkMode(State)
        
        enum Style {
            case neutral(State)
            case primary(State)
            case secondary(State)
            
            case positive(Size)
            case negative(Size)
        }
        
        enum State {
            case base(Size)
            case variant(Size)
            case disable(Size)
            case error(Size)
        }
        
        enum Size {
            case none(Weight)
            case micro(Weight)
            case tiny(Weight)
            case xxSmall(Weight)
            case xSmall(Weight)
            case small(Weight)
            case medium(Weight)
            case large(Weight)
            case xLarge(Weight)
            case xxLarge(Weight)
        }
        
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
    }
}
