//
//  AMHomeView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import SwiftUI

struct AMHomeView: View {
    // MARK: - Public Properties
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 2) {
                    Text("Top Picks for You")
                        .font(.title2)
                        .bold()
                        .padding(.top, 15)
                        .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            AMForYouView(title: "Made for You", image: .stationPick)
                            
                            AMForYouView(title: "Made for You", image: .chillMix)
                        }
                        .padding(.horizontal, 20)
                    }
                    .scrollIndicators(.hidden)
                    
                    Text("Recently Played")
                        .font(.title2)
                        .bold()
                        .padding(.top, 33)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 11)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            AMAlbumView(image: .makingMoviesArtwork, name: "Making Movies", artist: "Dire Straits")
                            
                            AMAlbumView(image: .brothersInArmsArtwork, name: "Brothers in Arms", artist: "Dire Straits")
                            
                            AMAlbumView(image: .direStraitsArtwork, name: "Dire Straits", artist: "Dire Straits")
                        }
                        .padding(.horizontal, 20)
                    }
                    .scrollIndicators(.hidden)
                }
                .navigationTitle("Home")
            }
        }
    }
}

struct AMAlbumView: View {
    // MARK: - Public Properties
    let image: ImageResource
    
    let name: String
    
    let artist: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
            
            Text(name)
                .font(.subheadline)
            
            Text(artist)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
