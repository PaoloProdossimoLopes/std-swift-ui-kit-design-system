import Foundation

protocol DSTokenFile {
    
    associatedtype Value
    
    var rawValue: String { get }
    var resourceName: String { get }
    var resourceType: String { get }
    
    var value: Value { get }
    
    var bundle: Bundle { get }
}

extension DSTokenFile {
    
    var resourceName: String {
        String(describing: Swift.type(of: self))
    }
    
    var resourceType: String {
        return "plist"
    }
    
    var bundle: Bundle {
        DSFoundation.shared.theme.bundle
    }
}

extension DSTokenFile {
    func notifyFatalError(file: String = #file) {
        let currentClass = file.split(separator: ".")[.zero]
        let description = "\(currentClass) not found for key \(rawValue)"
        fatalError(description)
    }
    
    func getFileValue<Value>(forResource name: String? = nil, ofType ext: String? = nil) -> Value? {
        guard
            let tokenDict = getFileValue(forResource: name, ofType: ext),
            let dictValue = tokenDict[rawValue] as? Value
        else { return nil }
        
        return dictValue
    }
    
    var value: Value {
        guard let value: Value = getFileValue() else {
            fatalError(String(describing: self) + " not found for the key \(rawValue)")
        }
        return value
    }
}

extension DSTokenFile where Value: Decodable {
    func getFileDecodableValue<Value: Decodable>(forResource name: String? = nil, ofType ext: String? = nil) -> Value? {
        guard let tokenDict = getFileValue(forResource: name, ofType: ext),
              let dictValue = tokenDict[rawValue] else {
            return nil
        }
        
        if !JSONSerialization.isValidJSONObject(dictValue) {
            return getFileValue(forResource: name, ofType: ext)
        }
        
        do {
            let json = try JSONSerialization.data(withJSONObject: dictValue)
            return try JSONDecoder.new.decode(Value.self, from: json)
        } catch {
            fatalError("Not possible to decode key value")
        }
    }
}

//MARK: - Helper
private extension DSTokenFile {
    func getFileValue(forResource name: String? = nil, ofType ext: String? = nil) -> NSDictionary? {
        guard let path = bundle.path(
            forResource: name ?? resourceName,
            ofType: ext ?? resourceType
        ) else {
            return nil
        }
        
        var fileValue: NSDictionary?
        
        if let storageDict = DSFoundation.shared.storage[path] {
            fileValue = storageDict
        }
        
        if let dict = NSDictionary(contentsOfFile: path) {
            fileValue = dict
            DSFoundation.shared.storage[path] = dict
        }
        
        return fileValue
    }
}
