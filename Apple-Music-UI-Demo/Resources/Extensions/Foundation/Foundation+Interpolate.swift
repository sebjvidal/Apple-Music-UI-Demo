//
//  Foundation+Interpolate.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 04/05/2024.
//

import Foundation

func interpolate(_ x: CGFloat, _ y: CGFloat, by value: CGFloat) -> CGFloat {
    return x + (y - x) * value.clamped(to: 0...1)
}
