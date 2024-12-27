//
//  SpotifyHeaderView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 05/11/24.
//


import SwiftUI

struct SpotifyHeaderView: View {
    @EnvironmentObject var libraryData: LibraryData
    @State private var headerSongTitle = "Song Title 1"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("A blend of music for Lucas and Sam. Updates daily.")
                .foregroundColor(.gray)
            
            HStack {
                Image("SpotifyLogo")
                    .foregroundColor(.green)
                Text("Spotify")
                    .foregroundColor(.white)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("2 likes · 3h 7m")
                        .foregroundColor(.gray)
                    
                    IconView(songTitle: headerSongTitle)
                        .padding(.top, 5)
                }
                Spacer()
                
                Button(action: {
                    // Handle play button functionality here
                }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)
                        .padding(15)
                        .background(Color.green)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.3), Color.black.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
    }
}
