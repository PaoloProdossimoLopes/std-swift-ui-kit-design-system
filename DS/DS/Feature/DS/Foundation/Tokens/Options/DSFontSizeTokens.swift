import UIKit

enum DSFontSizeTokens: String, CaseIterable {
    case ds_fontSize_none
    case ds_fontSize_micro
    case ds_fontSize_tiny
    case ds_fontSize_xxSmall
    case ds_fontSize_xSmall
    case ds_fontSize_small
    case ds_fontSize_medium
    case ds_fontSize_large
    case ds_fontSize_xLarge
    case ds_fontSize_xxLarge
}

//MARK: - DSTokenFile
extension DSFontSizeTokens: DSTokenFile {
    typealias Value = CGFloat
    
    var resourceName: String {
        DSFoundation.shared.theme.plistFontSizeFileName
    }
}
