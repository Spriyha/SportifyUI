//
//  SpotifyLyricsView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 07/11/24.
//
import SwiftUI
struct SpotifyLyricsView: View {
    @State private var progress: Double = 0.0 // Initial progress
    @State private var isPlaying: Bool = false // Flag to simulate playback
    @State private var timer: Timer? = nil // Timer to update progress
    @State private var currentLyricIndex: Int = 0 // Track the current lyric index
    @State private var lyrics: [String] = [
        "You were nothing new",
        "Someone I thought I always knew",
        "Something predictable",
        "But do I even know you?",
        "Did you feel the shift",
        "As soon as we locked eyes?",
        "I felt right then and there",
        "That you saw right through my disguise",
        "I never thought I'd break",
        "Who knew that it would take this long",
        "So familiar",
        "But I didn’t even know you at all",
        "Even after all this time",
        "Until we locked eyes"
    ]
    
    private let songDuration: Double = 4.04 // Song duration in minutes (4:04)

    var body: some View {
        ZStack {
            // Solid background color with RGB (184, 138, 76)
            Color(red: 184/255, green: 138/255, blue: 76/255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Song title and artist info at the top
                VStack {
                    Text("Locked Eyes")
                        .font(.headline)
                        .foregroundColor(.white)

                    Text("Mystery Friends")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.top, 40)

                Spacer()

                // Lyrics content in a scrollable view
                ScrollView {
                    VStack(alignment: .center, spacing: 5) {
                        ForEach(0..<lyrics.count, id: \.self) { index in
                            Text(lyrics[index])
                                .font(.custom("Arial", size: 26))  // Change to bigger font
                                .fontWeight(.bold)                 // Bold font
                                .foregroundColor(currentLyricIndex == index ? .white : .white.opacity(0.5))
                                .padding(.horizontal, 30)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 5)
                        }
                    }
                }
                .frame(maxHeight: .infinity)

                Spacer()

                // Playback controls (progress bar and play button)
                VStack {
                    // Progress bar with a moving circle
                    GeometryReader { geometry in
                        ZStack {
                            ProgressView(value: progress, total: 1)
                                .progressViewStyle(LinearProgressViewStyle())
                                .tint(.white)
                                .frame(height: 4)
                                .padding(.horizontal, 30)

           .animation(.linear(duration: 0.2), value: progress) // Slower animation
                        }
                    }
                    .frame(height: 20) // Ensuring the progress bar and circle are visible
                    .padding(.horizontal, 30)

                    // Time and play button
                    HStack {
                        Text(formatTime(progress * songDuration)) // Show current time based on progress
                            .foregroundColor(.white.opacity(0.7))

                        Spacer()

                        Button(action: {
                            // Toggle play/pause
                            if isPlaying {
                                // Pause the playback
                                timer?.invalidate()
                            } else {
                                // Start playback
                                startPlayback()
                            }
                            isPlaying.toggle()
                        }) {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }

                        Spacer()

                        Text(formatTime(songDuration)) // Show total time (4:04)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.bottom, 40)
            }
        }
    }

    // Function to format time (seconds) to minutes:seconds
    private func formatTime(_ timeInMinutes: Double) -> String {
        let minutes = Int(timeInMinutes)
        let seconds = Int((timeInMinutes - Double(minutes)) * 60)
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Function to start the playback timer
    private func startPlayback() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            // Update progress by a smaller amount (0.005) every 0.2 seconds
            if progress < 1.0 {
                progress += 0.005
            } else {
                progress = 0.0 // Reset when progress reaches the end
            }
            
            // Update the current lyric index based on progress
            let lyricIndex = Int(progress * Double(lyrics.count))
            if lyricIndex != currentLyricIndex {
                currentLyricIndex = lyricIndex
            }
        }
    }
}

struct SpotifyLyricsView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyLyricsView()
    }
}
