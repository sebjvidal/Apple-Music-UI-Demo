//
//  UIBlurEffect+VariableBlurEffect.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

extension UIBlurEffect {
    static func variableBlurEffect(radius: Double, maskImage: UIImage) -> UIBlurEffect? {
        let symbol = (@convention(c) (AnyClass, Selector, Double, UIImage) -> UIBlurEffect).self
        let selector = NSSelectorFromString("effectWithVariableBlurRadius:imageMask:")
        
        guard UIBlurEffect.responds(to: selector) else { return nil }
        
        let implementation = UIBlurEffect.method(for: selector)
        let method = unsafeBitCast(implementation, to: symbol)
        
        return method(UIBlurEffect.self, selector, radius, maskImage)
    }
}
