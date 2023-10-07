import Foundation

final class DSDarkerTheme: DSTheme {
    
    var plistColorFileName: String { "DSDarkerColor" }
    var plistTextFileName: String { "DSDarkerText" }
    var plistFontSizeFileName: String { "DSDarkerFontSize" }
    var plistSpacingFileName: String { "DSDarkerSpcaing" }
    var plistOpacityFileName: String { "DSDarkerOpcity" }
    var plistIconFileName: String { "DSDarkerIcons" }
    var plistFontFileName: String { "DSDarkerFontFamily" }
    
    var bundle: Bundle { .module }
    
}
