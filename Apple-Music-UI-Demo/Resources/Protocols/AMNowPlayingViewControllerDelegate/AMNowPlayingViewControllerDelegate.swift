//
//  AMNowPlayingViewControllerDelegate.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

protocol AMNowPlayingViewControllerDelegate: NSObject {
    func nowPlayingViewController(_ nowPlayingViewController: AMNowPlayingViewController, sourceRectFor view: UIView) -> CGRect
    func nowPlayingViewController(_ nowPlayingViewController: AMNowPlayingViewController, sourceViewFor view: UIView) -> AMToolbarView
}
