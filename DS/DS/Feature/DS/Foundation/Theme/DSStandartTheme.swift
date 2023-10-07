import Foundation

struct DSStandartTheme: DSTheme {
    
    let errorMessage = """
    ❌ A theme must be configured in:
       📂 ~> 'DSCore.shared.theme'
       before using tokens.
    """
    
    var plistColorFileName: String { fatalError(errorMessage) }
    var plistTextFileName: String { fatalError(errorMessage) }
    var plistFontSizeFileName: String { fatalError(errorMessage) }
    var plistSpacingFileName: String { fatalError(errorMessage) }
    var plistOpacityFileName: String { fatalError(errorMessage) }
    var plistIconFileName: String { fatalError(errorMessage) }
    var plistFontFileName: String { fatalError(errorMessage) }
    
    var bundle: Bundle { fatalError(errorMessage) }
}
