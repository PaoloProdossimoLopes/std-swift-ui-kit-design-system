import UIKit

final class DSButton: UIButton {
    
    //MARK: - Properties
    var option: DSButtonToken.Options
    
    //MARK: - Constructors
    
    init(option: DSButtonToken.Options) {
        self.option = option
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
//    private func updateConfigurationPropertie() {
//        setTitleColor(formatter.textColor, for: .normal)
//
//        backgroundColor = formatter.backgroundColor
//
//        layer.borderColor = formatter.borderColor.cgColor
//        layer.borderWidth = formatter.borderWidth
//        layer.cornerRadius = formatter.borderRadius
//    }
    
    //MARK: - Models
    struct DataConfiguration {
        
    }
}

extension DSButton {
    private func setup() {
        applyTokens()
    }
    
    private func applyTokens() {
        DSButtonToken.applyToken(self, variant: option)
    }
}
