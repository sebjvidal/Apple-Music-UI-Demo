//
//  UIScreen+DisplayCornerRadius.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

extension UIScreen {
    var displayCornerRadius: CGFloat {
        return value(forKey: "_displayCornerRadius") as? CGFloat ?? 0
    }
}
