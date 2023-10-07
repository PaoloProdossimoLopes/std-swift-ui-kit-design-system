import Foundation

protocol DSTheme {
    
    //MARK: - file names
    var plistColorFileName: String { get }
    var plistTextFileName: String { get }
    var plistFontSizeFileName: String { get }
    var plistSpacingFileName: String { get }
    var plistOpacityFileName: String { get }
    var plistIconFileName: String { get }
    var plistFontFileName: String { get }
    
    //MARK: - Bundles
    var bundle: Bundle { get }
    var fontsBundle: Bundle { get }
}

//MARK: - Default implementations
extension DSTheme {
    
    var plistColorFileName: String { "IDSTokensColor" }
    var plistTextFileName: String { "IDSTokensText" }
    var plistFontSizeFileName: String { "IDSTokensFontSize" }
    var plistSpacingFileName: String { "IDSTokensSpcaing" }
    var plistOpacityFileName: String { "IDSTokensOpcity" }
    var plistIconFileName: String { "IDSTokensIcons" }
    var plistFontFileName: String { "IDSTokensFontFamily" }
    
    var fontsBundle: Bundle { bundle }
}
