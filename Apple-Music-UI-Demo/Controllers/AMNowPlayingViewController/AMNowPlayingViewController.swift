//
//  AMNowPlayingViewController.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMNowPlayingViewController: UIViewController {
    // MARK: - Private Properties
    private var backgroundView: AMGradientView!
    private var gripView: AMGripView!
    private var artworkView: AMArtworkView!
    private var controlsView: AMControlsView!
    
    var animationController: AMNowPlayingAnimationController!
    
    // MARK: - Public Properties
    weak var delegate: AMNowPlayingViewControllerDelegate? = nil
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupViewController()
        setupBackgroundView()
        setupGripView()
        setupArtworkView()
        setupControlsView()
        setupAnimationController()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViewController() {
        modalPresentationStyle = .custom
    }
    
    private func setupBackgroundView() {
        backgroundView = AMGradientView()
        backgroundView.backgroundColor = .red
        backgroundView.colours = [.theMiracleGradientStart, .theMiracleGradientEnd]
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupGripView() {
        gripView = AMGripView()
        gripView.translatesAutoresizingMaskIntoConstraints = false
        gripView.setContentHuggingPriority(.required, for: .vertical)
        gripView.addTarget(self, action: #selector(gripViewTapped), for: .touchUpInside)
        
        view.addSubview(gripView)
        
        NSLayoutConstraint.activate([
            gripView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            gripView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func gripViewTapped(_ sender: AMGripView) {
        dismiss(animated: true)
    }
    
    private func setupArtworkView() {
        artworkView = AMArtworkView()
        artworkView.artwork = .theMiracleArtwork
        artworkView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(artworkView)
        
        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: gripView.bottomAnchor, constant: 30),
            artworkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            artworkView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        ])
    }
    
    private func setupControlsView() {
        controlsView = AMControlsView()
        controlsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(controlsView)
        
        NSLayoutConstraint.activate([
            controlsView.topAnchor.constraint(equalTo: artworkView.bottomAnchor, constant: 52.66),
            controlsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            controlsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            controlsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18)
        ])
    }
    
    private func setupAnimationController() {
        animationController = AMNowPlayingAnimationController(parent: self)
        animationController.setupPanGestureRecogniser(in: view)
        
        transitioningDelegate = animationController
    }
}
