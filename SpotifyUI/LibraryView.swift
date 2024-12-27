//
//  LibraryView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 11/11/24.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var libraryData: LibraryData
    var body: some View {
        VStack(spacing: 20) {
            Text("My Library")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
            
            HStack {
                Text("Liked Songs")
                Spacer()
                Text("\(libraryData.likedCount)")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)

//            HStack {
//                Text("Added to Playlist")
//                Spacer()
//                Text("\(libraryData.playlistCount)")
//            }
//            .foregroundColor(.white)
//            .padding()
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
