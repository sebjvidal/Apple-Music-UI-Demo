//
//  AMControlsView+ControlsView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 30/04/2024.
//

import SwiftUI

extension AMControlsView {
    struct ControlsView: View {
        var body: some View {
            VStack(spacing: 32.66) {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Was It All Worth It")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Queen")
                            .font(.title3)
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    AMSliderView(progress: 0.33)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 30))
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "pause.fill")
                                .font(.system(size: 50))
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 30))
                        }
                        
                        Spacer()
                    }
                    .tint(.white)
                    
                    Spacer()
                    
                    AMSliderView(progress: 0.5)
                }
                
                HStack(spacing: 0) {
                    Button(action: {}) {
                        Image(systemName: "quote.bubble")
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "airplayaudio")
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "list.bullet")
                    }
                }
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.horizontal, 52)
            }
        }
    }
}
