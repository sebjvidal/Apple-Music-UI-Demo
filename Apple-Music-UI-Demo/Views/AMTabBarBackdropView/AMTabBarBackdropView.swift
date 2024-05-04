//
//  AMTabBarBackdropView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMTabBarBackdropView: UIView {
    // MARK: - Private Properties
    private var visualEffectView: UIVisualEffectView!
    private var overlayView: AMGradientView!
    
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVisualEffectView()
        setupOverlayView()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupVisualEffectView() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.effect = UIBlurEffect.variableBlurEffect(radius: 30, maskImage: .tabBarBackdropMask)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(visualEffectView)
        
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: topAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupOverlayView() {
        overlayView = AMGradientView()
        overlayView.locations = [0, 0.4]
        overlayView.colours = [.tabBarBackdropOverlay.withAlphaComponent(0), .tabBarBackdropOverlay]
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(overlayView)
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
