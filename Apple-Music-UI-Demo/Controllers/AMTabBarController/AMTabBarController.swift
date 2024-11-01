//
//  AMTabBarController.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMTabBarController: UITabBarController, AMToolbarViewDelegate, AMNowPlayingViewControllerDelegate {
    // MARK: - Private Properties
    private var toolbarView: AMToolbarView!
    private var backdropView: AMTabBarBackdropView!
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String? = nil, bundle: Bundle? = nil) {
        super.init(nibName: nibName, bundle: bundle)
        setupTabBarItems()
        setupTabBarAppearance()
        setupToolbarView()
        setupBackdropView()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupTabBarItems() {
        viewControllers = Tab.allCases.map(\.viewController)
    }
    
    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func setupToolbarView() {
        toolbarView = AMToolbarView()
        toolbarView.delegate = self
        toolbarView.song = AMSong(artwork: .theMiracleArtwork, title: "Was It All Worth It")
        toolbarView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(toolbarView)
        
        NSLayoutConstraint.activate([
            toolbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            toolbarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            toolbarView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: -6)
        ])
    }
    
    private func setupBackdropView() {
        backdropView = AMTabBarBackdropView()
        backdropView.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(backdropView, belowSubview: tabBar)
        
        NSLayoutConstraint.activate([
            backdropView.topAnchor.constraint(equalTo: toolbarView.topAnchor),
            backdropView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backdropView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backdropView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateAdditionalSafeAreaInsets() {
        let tabBarHeight = tabBar.frame.height
        let toolbarY = toolbarView.frame.origin.y - 9.33
        let inset = view.frame.height - toolbarY - tabBarHeight
        
        viewControllers?.forEach { viewController in
            viewController.additionalSafeAreaInsets.bottom = inset
        }
    }
    
    private func presentNowPlayingViewControllerIfNeeded() {
        guard presentedViewController == nil else { return }
        
        let viewController = AMNowPlayingViewController()
        viewController.delegate = self
        
        present(viewController, animated: true)
    }
    
    // MARK: - viewDidLayoutSubviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateAdditionalSafeAreaInsets()
    }
    
    // MARK: - AMToolbarViewDelegate
    func toolbarView(_ toolbarView: AMToolbarView, tapGestureRecognised tapGestureRecogniser: UITapGestureRecognizer) {
        presentNowPlayingViewControllerIfNeeded()
    }
    
    // MARK: - AMNowPlayingViewControllerDelegate
    func nowPlayingViewController(_ nowPlayingViewController: AMNowPlayingViewController, sourceRectFor view: UIView) -> CGRect {
        return toolbarView.frame
    }
    
    func nowPlayingViewController(_ nowPlayingViewController: AMNowPlayingViewController, sourceViewFor view: UIView) -> AMToolbarView {
        return toolbarView
    }
}
