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
        self.type = .label(.default(.neutral(.base(.small(.regular)))))
        super.init(frame: frame)
        setup()
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
