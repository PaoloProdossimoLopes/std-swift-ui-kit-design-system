import UIKit

enum DSSpacingTokens: String, CaseIterable {
    case ds_Spacing_none
    case ds_Spacing_micro
    case ds_Spacing_tiny
    case ds_Spacing_xxSmall
    case ds_Spacing_xSmall
    case ds_Spacing_small
    case ds_Spacing_medium
    case ds_Spacing_large
    case ds_Spacing_xLarge
    case ds_Spacing_xxLarge
}

//MARK: - DSTokenFile
extension DSSpacingTokens: DSTokenFile {
    typealias Value = CGFloat
    
    var resourceName: String {
        DSFoundation.shared.theme.plistSpacingFileName
    }
}
