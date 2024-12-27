//
//  IconView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 05/11/24.
//
import SwiftUI

//struct IconView: View {
//    var body: some View {
//        HStack(spacing: 30) {
//            Image("like")
//            Image("Add")
//            Image("Download")
//            Image(systemName: "ellipsis")
//                .foregroundColor(.gray)
//                .rotationEffect(.degrees(90))
//        }
//    }
//}
struct IconView: View {
    var songTitle: String
    @EnvironmentObject var libraryData: LibraryData

    var body: some View {
        HStack(spacing: 30) {
            // Heart Icon for like/unlike
            Image(systemName: libraryData.isLiked(songTitle: songTitle) ? "heart.fill" : "heart")
                .foregroundColor(libraryData.isLiked(songTitle: songTitle) ? .green : .gray)
                .onTapGesture {
                    libraryData.toggleLike(for: songTitle)
                }
            
            Image("Add")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Image("Download")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Image(systemName: "ellipsis")
                .foregroundColor(.gray)
                .rotationEffect(.degrees(90))
                .frame(width: 24, height: 24)
        }
    }
}

