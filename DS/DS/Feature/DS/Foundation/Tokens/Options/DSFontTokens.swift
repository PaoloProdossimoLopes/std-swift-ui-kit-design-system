import UIKit

enum DSFontTokens: String, CaseIterable {
    case ds_font_thin
    case ds_font_light
    case ds_font_regular
    case ds_font_medium
    case ds_font_demibold
    case ds_font_bold
    case ds_font_black
    case ds_font_heavy
}

extension DSFontTokens {
    var font: UIFont {
        guard let font = UIFont(name: value, size: 12) else {
            fatalError("could not found font: \(value)")
        }
        return font
    }
}

//MARK: - DSTokenFile
extension DSFontTokens: DSTokenFile {
    typealias Value = String
    
    var resourceName: String {
        DSFoundation.shared.theme.plistFontFileName
    }
}
