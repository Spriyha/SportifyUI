//
//  CustomActionSheetView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 06/11/24.
//
import SwiftUI
import Combine

class LibraryData: ObservableObject {
    @Published var likedCount = 0
    @Published private var likedSongs = Set<String>()  // Tracks liked songs by title
    
    func toggleLike(for songTitle: String) {
        if likedSongs.contains(songTitle) {
            likedSongs.remove(songTitle)
            likedCount -= 1
        } else {
            likedSongs.insert(songTitle)
            likedCount += 1
        }
    }
    
    func isLiked(songTitle: String) -> Bool {
        likedSongs.contains(songTitle)
    }
}


struct CustomActionSheetView: View {
    var songImage: String
    var songTitle: String
    var songArtist: String
    var onDismiss: () -> Void
    @EnvironmentObject var libraryData: LibraryData

    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 20) {
                // Song information header
                HStack {
                    Image(songImage)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(songTitle)
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        Text(songArtist)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                Divider().background(Color.gray)
                
                // Toggle Like button based on liked status
                ActionSheetButton(
                    icon: libraryData.isLiked(songTitle: songTitle) ? "heart.fill" : "heart",
                    label: libraryData.isLiked(songTitle: songTitle) ? "Remove from Liked Songs" : "Add to Liked Songs"
                ) {
                    libraryData.toggleLike(for: songTitle)
                    onDismiss()
                }
                
                // Add to Playlist button
                ActionSheetButton(icon: "plus", label: "Add to Playlist") {
                    //libraryData.addSongToPlaylist(songTitle)
                    onDismiss()
                }
                
                // Other actions
                ActionSheetButton(icon: "text.badge.plus", label: "Add to Queue") {
                    onDismiss()
                }
                ActionSheetButton(icon: "opticaldisc", label: "View Album") {
                    onDismiss()
                }
                
                ActionSheetButton(icon: "square.and.arrow.up", label: "Share") {
                    onDismiss()
                }
                
                // Lyrics button using NavigationLink
                NavigationLink(destination: SpotifyLyricsView()) {
                    HStack {
                        Image(systemName: "person.2.fill")
                            .foregroundColor(.white)
                        Text("Lyrics")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                
                ActionSheetButton(icon: "radio", label: "Go to Song Radio") {
                    onDismiss()
                }
                
                // Cancel button to close the action sheet
                Button(action: onDismiss) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color(red: 35 / 255, green: 35 / 255, blue: 35 / 255))
            .cornerRadius(20)
            .padding(.horizontal, 5)
            .shadow(radius: 20)
        }
    }
}

// Reusable ActionSheetButton for custom actions
struct ActionSheetButton: View {
    var icon: String
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.white)
                Text(label)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
        }
    }
}
