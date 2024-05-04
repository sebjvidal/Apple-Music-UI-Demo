//
//  AMToolbarViewDelegate.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

protocol AMToolbarViewDelegate: NSObject {
    func toolbarView(_ toolbarView: AMToolbarView, tapGestureRecognised tapGestureRecogniser: UITapGestureRecognizer)
}
