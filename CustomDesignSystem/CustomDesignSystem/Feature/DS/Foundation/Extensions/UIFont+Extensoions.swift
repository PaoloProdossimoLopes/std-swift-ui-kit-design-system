import UIKit

extension UIFont {
    private static let defaultFontExtension: String = "ttf"
    
    static func registerFont(forToken token: DSFontTokens) {
        let font = UIFont(name: token.value.fontName, size: token.value.fontSize)
        let fontIsNotRegistered = (font == nil)
        guard fontIsNotRegistered else { return }
        
        let fontFile = NSString(string: token.value.fontFile)
        let fontName = fontFile.deletingPathExtension
        let fontExtension = fontFile.pathExtension
        
        if let fontPath = DSFoundation.shared.theme.fontsBundle.path(forResource: fontName, ofType: fontExtension),
           let fontData = NSData(contentsOfFile: fontPath),
           let dataProvider = CGDataProvider(data: fontData),
           let font = CGFont(dataProvider) {
            
            var error: Unmanaged<CFError>?
            
            if !CTFontManagerRegisterGraphicsFont(font, &error) {
                let message = """
                Failed to register font from path \(fontPath).
                This font may have already been registered in the main bundle.
                """
                fatalError(message)
            }
        } else {
            let message = """
            Failed to register font with name \(fontFile).
            This font file may have already be in the project bundle.
            """
            fatalError(message)
        }
    }
    
    convenience init?(token: DSFontTokens) {
        UIFont.registerFont(forToken: token)
        self.init(name: token.value.fontName, size: token.value.fontSize)
    }
}
