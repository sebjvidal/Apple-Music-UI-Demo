//
//  AMForYouView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import SwiftUI

struct AMForYouView: View {
    // MARK: - Public Properties
    let title: String
    
    let image: ImageResource
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Image(image)
        }
    }
}
