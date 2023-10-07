import UIKit

enum DSIconTokens: String, CaseIterable {
    case ds_icon_01
    case ds_icon_02
    case ds_icon_03
    case ds_icon_04
    case ds_icon_05
    case ds_icon_06
    case ds_icon_07
    case ds_icon_08
    case ds_icon_09
    case ds_icon_10
    case ds_icon_11
    case ds_icon_12
    case ds_icon_13
    case ds_icon_14
    case ds_icon_15
}

//MARK: - DSTokenFile
extension DSIconTokens: DSTokenFile {
    var value: String {
        guard let value: String = getFileValue(),
              let unicodeConverterForSwift = try? UnicodeConverter(pattern: "\\\\u\\{([0-9A-Fa-f]+)}\\}") else {
            fatalError(String(describing: self) + "not found for the key \(rawValue)")
        }
        let result = unicodeConverterForSwift.stringByReplacingMatches(
            in: value,
            range: NSRange(0 ..< value.utf16.count),
            withTemplate: "???"
        )
        return result
    }
    
    var resourceName: String {
        DSFoundation.shared.theme.plistIconFileName
    }
}

final class UnicodeConverter: NSRegularExpression {
    override func replacementString(for result: NSTextCheckingResult, in string: String, offset: Int, template templ: String) -> String {
        if result.numberOfRanges == 2,
           case let nsString = string as NSString,
           case let macthedString = nsString.substring(with: result.range(at: 1)),
           let unicodeScalarValue = UInt32(macthedString, radix: 16),
           let unicodeScalar = UnicodeScalar(unicodeScalarValue) {
            return String(unicodeScalar)
        } else {
            return super.replacementString(for: result, in: string, offset: offset, template: templ)
        }
    }
}
