import Foundation

final class DSFoundation {
    
    //MARK: - Singleton
    static let shared: DSFoundation = .init()
    
    //MARK: - Properties
    var storage: [String: NSDictionary] = [:]
    var theme: DSTheme = DSStandartTheme() {
        didSet { storage = [:] }
    }
    
    //MARK: - Read
    var bundle: Bundle {
        Bundle(for: Self.self)
    }
    
    //MARK: - Constructor
    private init() { /*SINGLETON*/ }
}
