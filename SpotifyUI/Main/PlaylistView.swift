//
//  PlaylistView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 28/10/24.
//
import SwiftUI

struct Song: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let artist: String
}



struct PlaylistView: View {
    @EnvironmentObject var libraryData: LibraryData
    @State private var selectedSongImage: String? = nil
    @State private var selectedSongTitle: String = ""
    @State private var selectedSongArtist: String = ""
    @State private var showMiniPlayer: Bool = false
    @State private var isPlaying: Bool = false
    @State private var showPopup: Bool = false
    @State private var popupMessage: String = ""
    @State private var showCustomActionSheet: Bool = false
    
    let songs = [
        Song(imageName: "P1", title: "Song Title 1", artist: "Artist 1"),
        Song(imageName: "P2", title: "Song Title 2", artist: "Artist 2"),
        Song(imageName: "P3", title: "Song Title 3", artist: "Artist 3"),
        Song(imageName: "P4", title: "Song Title 4", artist: "Artist 4"),
        Song(imageName: "P5", title: "Song Title 5", artist: "Artist 5")
    ]
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                // Display either selected song image or default placeholder
                if let imageName = selectedSongImage {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 260, height: 260)
                        .clipped()
                } else {
                    OverlappingCirclesView()
                        .frame(height: 260)
                }
                
                Text("Lucas+Sam")
                    .font(.system(size: 40))
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Spacer()
                
                // Spotify Header
                SpotifyHeaderView()
                .frame(height: 150)
                
                // Song List with Like and Options Buttons
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(songs) { song in
                            HStack {
                                Image(song.imageName)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(5)
                                
                                VStack(alignment: .leading) {
                                    Text(song.title)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(song.artist)
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                }
                                Spacer()
                                
                                // Like Button
                                Button(action: {
                                    libraryData.toggleLike(for: song.title)
                                    showPopup(for: song.title)
                                }) {
                                    Image(systemName: libraryData.isLiked(songTitle: song.title) ? "heart.fill" : "heart")
                                        .foregroundColor(libraryData.isLiked(songTitle: song.title) ? .green : .gray)
                                }
                                
                                // Ellipsis Button to Show Custom Action Sheet
                                Button(action: {
                                    selectedSongImage = song.imageName
                                    selectedSongTitle = song.title
                                    selectedSongArtist = song.artist
                                    showCustomActionSheet = true
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.gray)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 10)
                }
                .background(Color.black)
                
                // MiniPlayer View
                if showMiniPlayer {
                    MiniPlayerView(songTitle: selectedSongTitle, songImage: selectedSongImage ?? "P1", isPlaying: $isPlaying)
                        .environmentObject(libraryData)
                        .transition(.move(edge: .bottom))
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            
            // Popup Notification Overlay
            if showPopup {
                VStack {
                    Spacer()
                    Text(popupMessage)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.bottom, 40)
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation { showPopup = false }
                            }
                        }
                }
            }
            
            // Custom Action Sheet Overlay
            if showCustomActionSheet {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showCustomActionSheet = false
                    }
                
                CustomActionSheetView(
                    songImage: selectedSongImage ?? "P1",
                    songTitle: selectedSongTitle,
                    songArtist: selectedSongArtist,
                    onDismiss: {
                        showCustomActionSheet = false
                    }
                )
                .environmentObject(libraryData)
                .transition(.move(edge: .bottom))
                .animation(.spring())
            }
        }
    }
    
    // Function to Show Popup Notification
    private func showPopup(for songTitle: String) {
        popupMessage = libraryData.isLiked(songTitle: songTitle) ? "\(songTitle) added to Liked Songs" : "\(songTitle) removed from Liked Songs"
        withAnimation { showPopup = true }
    }
}


struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}
