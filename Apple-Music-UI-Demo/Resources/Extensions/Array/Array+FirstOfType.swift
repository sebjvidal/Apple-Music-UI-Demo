//
//  Array+FirstOfType.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import Foundation

extension Array {
    func first<T>(of type: T.Type) -> T? {
        first { $0 is T } as? T
    }
}
