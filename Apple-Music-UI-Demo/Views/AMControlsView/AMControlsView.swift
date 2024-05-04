//
//  AMControlsView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 30/04/2024.
//

import UIKit
import SwiftUI

class AMControlsView: UIView {
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHostingView()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupHostingView() {
        let rootView = ControlsView()
        let hostingView = _UIHostingView(rootView: rootView)
        hostingView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(hostingView)
        
        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: topAnchor),
            hostingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hostingView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
