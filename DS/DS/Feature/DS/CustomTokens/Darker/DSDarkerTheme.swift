import Foundation

final class DSDarkerTheme: DSTheme {
    
    let plistColorFileName = "DSDarkerColorTokens"
    let plistFontSizeFileName = "DSDarkerFontSizeTokens"
    let plistSpacingFileName = "DSDarkerSpcaingTokens"
    let plistOpacityFileName = "DSDarkerOpcityTokens"
    let plistIconFileName = "DSDarkerIconsTokens"
    let plistFontFileName = "DSDarkerFontTokens"
    
    var bundle: Bundle { .init(for: DSDarkerTheme.self) }
}
