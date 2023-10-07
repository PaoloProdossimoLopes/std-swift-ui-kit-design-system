struct DSTextToken: DSTokenProtocol {
    
    //MARK: - Types
    typealias Variant = DSTextToken.TextType
    typealias Component = DSText
    
    //MARK: - Types
    enum TextType {
        case label(LabelVariant)
    }
    
    //MARK: - Modifier
    static func applyToken(_ component: DSText, variant: TextType) {
        switch variant {
        case .label(let contrast):
            DSTextLabelToken.applyToken(component, variant: contrast)
        }
    }
}
