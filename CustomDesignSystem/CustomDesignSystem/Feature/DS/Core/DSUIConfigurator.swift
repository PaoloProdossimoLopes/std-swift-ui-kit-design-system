//
//  DSUIConfigurator.swift
//  CustomDesignSystem
//
//  Created by Paolo Prodossimo Lopes on 27/05/22.
//

final class DSUIConfigurator {
    
    private init() { /*SINGLETON*/ }
    
    static func setup(_ theme: DSTheme) {
        DSFoundation.shared.theme = theme
    }
}
