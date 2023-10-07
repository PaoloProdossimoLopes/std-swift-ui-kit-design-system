import UIKit

enum DSColorTokens: String, CaseIterable {
    case ds_color_primary_onLightMode
    case ds_color_primary_onDarkMode
    case ds_color_privary_variant_01_onLightMode
    case ds_color_privary_variant_01_onDarkMode
    case ds_color_privary_variant_02_onLightMode
    case ds_color_privary_variant_02_onDarkMode
    
    case ds_color_secundary_onLightMode
    case ds_color_secundary_onDarkMode
    case ds_color_secundary_variant_01_onLightMode
    case ds_color_secundary_variant_01_onDarkMode
    case ds_color_secundary_variant_02_onLightMode
    case ds_color_secundary_variant_02_onDarkMode
    
    case ds_color_backgorund_onLightMode
    case ds_color_backgorund_onDarkMode
    case ds_color_backgorund_variant_01_onLightMode
    case ds_color_backgorund_variant_01_onDarkMode
    case ds_color_backgorund_variant_02_onLightMode
    case ds_color_backgorund_variant_02_onDarkMode
    
    /*
     .
     .
     .
     */
}

//MARK: - DSTokenFile
extension DSColorTokens: DSTokenFile {
    var value: UIColor {
        guard let value: String = getFileValue() else {
            let currentFile = String(describing: self)
            let description = "\(currentFile) not found for key \(rawValue)"
            fatalError(description)
        }
        
        return .init(hex: value)
    }
    
    var resourceName: String {
        DSFoundation.shared.theme.plistColorFileName
    }
}
