import UIKit

enum DSFontTokens: String, CaseIterable {
    case ds_font_01_thin
    case ds_font_01_light
    case ds_font_01_regular
    case ds_font_01_medium
    case ds_font_01_demibold
    case ds_font_01_bold
    case ds_font_01_black
    case ds_font_01_heavy
}

extension DSFontTokens {
    var font: UIFont {
        guard let font = UIFont(token: self) else {
            fatalError("could not found font: \(value.fontName)")
        }
        let metrics = UIFontMetrics.default
        return metrics.scaledFont(for: font, maximumPointSize: value.fontSize)
    }
    
    func getAttributedString(with text: String = .init()) -> NSMutableAttributedString {
        let paragraph = NSMutableParagraphStyle()
        paragraph.minimumLineHeight = value.lineHeight
        
        let atttributed = NSMutableAttributedString(string: text)
        atttributed.addAttribute(
            .paragraphStyle,
            value: paragraph,
            range: .init(location: 0, length: atttributed.length)
        )
        return atttributed
    }
}

//MARK: - DSTokenFile
extension DSFontTokens: DSTokenFile {
    typealias Value = FontFamily
    
    struct FontFamily: Decodable {
        let fontName: String
        let fontFile: String
        let fontSize: CGFloat
        let lineHeight: CGFloat
    }
    
    var resourceName: String {
        DSFoundation.shared.theme.plistFontFileName
    }
}
