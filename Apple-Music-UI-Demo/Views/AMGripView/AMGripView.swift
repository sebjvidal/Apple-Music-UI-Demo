//
//  AMGripView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMGripView: UIControl {
    // MARK: - Private Properties
    private var backgroundView: UIView!
    
    // MARK: - Public Properties
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 36, height: 5)
    }
    
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundView()
        setupTapGestureRecogniser()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupBackgroundView() {
        backgroundView = UIView()
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerCurve = .circular
        backgroundView.backgroundColor = .white.withAlphaComponent(0.5)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupTapGestureRecogniser() {
        let tapGestureRecogniser = UITapGestureRecognizer()
        tapGestureRecogniser.addTarget(self, action: #selector(tapGestureRecognised))
        
        addGestureRecognizer(tapGestureRecogniser)
    }
    
    @objc private func tapGestureRecognised(_ sender: UITapGestureRecognizer) {
        sendActions(for: .touchUpInside)
    }
    
    private func layoutBackgroundView() {
        backgroundView.layer.cornerRadius = frame.height / 2
    }
    
    // MARK: - layoutSubviews()
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutBackgroundView()
    }
}
