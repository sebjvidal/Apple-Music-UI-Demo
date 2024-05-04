//
//  AMGradientView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMGradientView: UIView {
    // MARK: - Private Properties
    private var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    // MARK: - Public Properties
    var colours: [UIColor] = [] {
        didSet { updateUI(for: colours) }
    }
    
    var locations: [NSNumber]? {
        get {
            return gradientLayer.locations
        } set {
            gradientLayer.locations = newValue
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupGradientLayer() {
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    }
    
    private func updateUI(for colours: [UIColor]) {
        gradientLayer.colors = colours.map(\.cgColor)
    }
    
    // MARK: - traitCollectionDidChange(_:)
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateUI(for: colours)
    }
}
