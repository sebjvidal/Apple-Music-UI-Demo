//
//  Comparable+ClampedTo.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 04/05/2024.
//

import Foundation

extension Comparable {
    func clamped(to limit: ClosedRange<Self>) -> Self {
        return min(max(self, limit.lowerBound), limit.upperBound)
    }
}
