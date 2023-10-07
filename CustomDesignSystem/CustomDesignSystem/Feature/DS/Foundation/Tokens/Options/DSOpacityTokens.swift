import UIKit

enum DSOpacityTokens: String, CaseIterable {
    case ds_opacity_invisible
    case ds_opacity_soft
    case ds_opacity_visible
}

//MARK: - DSTokenFile
extension DSOpacityTokens: DSTokenFile {
   var value: CGFloat {
        guard let value: Double = getFileValue() else {
            let currentFile = String(describing: self)
            let description = "\(currentFile) not found for key \(rawValue)"
            fatalError(description)
        }
        
        return CGFloat(value)
    }
    
    var resourceName: String {
        DSFoundation.shared.theme.plistOpacityFileName
    }
}
