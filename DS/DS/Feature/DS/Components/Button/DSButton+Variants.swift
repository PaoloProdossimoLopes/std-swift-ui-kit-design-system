extension DSButtonToken {
    
    enum SquareVariant {
        case rounded(OptionVariant)
        case clipped(OptionVariant)
    }
    
    enum RectangleVariant {
        case rounded(OptionVariant)
    }
    
    enum OptionVariant {
        case `default`(Style)
        case boadered(Boarder)
    }
    
    enum Boarder {
        case fine(Style)
    }
    
    enum Style {
        case primary(Size)
        case secundary(Size)
        case neutral(Size)
    }
    
    enum Size {
        case none(Geometry)
        case micro(Geometry)
        case tiny(Geometry)
        case xxSmall(Geometry)
        case xSmall(Geometry)
        case small(Geometry)
        case medium(Geometry)
        case large(Geometry)
        case xLarge(Geometry)
        case xxLarge(Geometry)
    }
    
    enum Geometry {
        case square
        case rectangle
        case circle
    }
}
