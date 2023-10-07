import UIKit

enum DSSpacingTokens: String, CaseIterable {
    case ds_spacing_none
    case ds_spacing_micro
    case ds_spacing_tiny
    case ds_spacing_xxSmall
    case ds_spacing_xSmall
    case ds_spacing_small
    case ds_spacing_medium
    case ds_spacing_large
    case ds_spacing_xLarge
    case ds_spacing_xxLarge
}

//MARK: - DSTokenFile
extension DSSpacingTokens: DSTokenFile {
    typealias Value = CGFloat
    
    var resourceName: String {
        DSFoundation.shared.theme.plistSpacingFileName
    }
}
