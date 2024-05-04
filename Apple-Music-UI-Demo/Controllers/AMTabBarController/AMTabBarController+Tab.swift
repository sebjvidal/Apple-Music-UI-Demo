//
//  AMTabBarController+Tab.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit
import SwiftUI

extension UITabBarController {
    enum Tab: Int, CaseIterable {
        // MARK: - Cases
        case home = 0
        case browse = 1
        case radio = 2
        case library = 3
        case search = 4
        
        // MARK: - Public Properties
        var viewController: UIViewController {
            switch self {
            case .home:
                let homeViewController = UIHostingController(rootView: AMHomeView())
                homeViewController.tabBarItem = UITabBarItem(title: "Home", image: .home, tag: 0)
                
                return homeViewController
            case .browse:
                let browseViewController = UIViewController()
                browseViewController.view.backgroundColor = .systemBackground
                browseViewController.tabBarItem = UITabBarItem(title: "Browse", image: .browse, tag: 1)
                
                return browseViewController
            case .radio:
                let radioViewController = UIViewController()
                radioViewController.view.backgroundColor = .systemBackground
                radioViewController.tabBarItem = UITabBarItem(title: "Radio", image: .radio, tag: 2)
                
                return radioViewController
            case .library:
                let libraryViewController = UIViewController()
                libraryViewController.view.backgroundColor = .systemBackground
                libraryViewController.tabBarItem = UITabBarItem(title: "Library", image: .library, tag: 3)
                
                return libraryViewController
            case .search:
                let searchViewController = UIViewController()
                searchViewController.view.backgroundColor = .systemBackground
                searchViewController.tabBarItem = UITabBarItem(title: "Search", image: .search, tag: 4)
                
                return searchViewController
            }
        }
    }
}
