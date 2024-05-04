//
//  UIButton.Configuration+Toolbar.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

extension UIButton.Configuration {
    static func toolbar() -> UIButton.Configuration {
        var configuration: UIButton.Configuration = .plain()
        configuration.baseForegroundColor = .label
        configuration.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 18)
        
        return configuration
    }
}
