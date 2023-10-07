import Foundation

protocol DSTheme {
    
    //MARK: - file names
    var plistColorFileName: String { get }
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
    
    var plistColorFileName: String { "DSTokensColor" }
    var plistFontSizeFileName: String { "DSTokensFontSize" }
    var plistSpacingFileName: String { "DSTokensSpcaing" }
    var plistOpacityFileName: String { "DSTokensOpcity" }
    var plistIconFileName: String { "DSTokensIcons" }
    
    var fontsBundle: Bundle { bundle }
}
