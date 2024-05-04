//
//  AMSliderView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 30/04/2024.
//

import SwiftUI

struct AMSliderView: View {
    // MARK: - Public Properties
    let progress: Double
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 7)
                .foregroundStyle(.ultraThinMaterial)
                .overlay {
                    GeometryReader { geometry in
                        Color.white
                            .opacity(0.5)
                            .frame(width: geometry.size.width * progress)
                    }
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 3.5))
    }
}
