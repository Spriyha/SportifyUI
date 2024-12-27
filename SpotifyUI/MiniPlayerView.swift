//
//  MiniPlayerView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 05/11/24.
//

import SwiftUI

struct MiniPlayerView: View {
    var songTitle: String
    var songImage: String
    @Binding var isPlaying: Bool
    @EnvironmentObject var libraryData: LibraryData
    @State private var progress: Double = 0
    @State private var countdown: Int = 120
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(songImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
                    .padding(.trailing, 8)
                
                VStack(alignment: .leading) {
                    Text(songTitle)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Text("Now Playing")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                Spacer()
                
                // Heart Icon for like/unlike
                Image(systemName: libraryData.isLiked(songTitle: songTitle) ? "heart.fill" : "heart")
                    .foregroundColor(libraryData.isLiked(songTitle: songTitle) ? .green : .gray)
                    .onTapGesture {
                        libraryData.toggleLike(for: songTitle)
                    }
                    .padding(.trailing, 8)
                
                Button(action: {
                    isPlaying.toggle()
                    if isPlaying {
                        startTimer()
                    } else {
                        stopTimer()
                    }
                }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .padding()
            .background(Color.black)
            
            ProgressView(value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: .white))
                .frame(height: 4)
                .background(Color.white.opacity(0.3))
                .cornerRadius(2)
                .padding(.horizontal)
                .padding(.bottom, 8)
                .onAppear {
                    if isPlaying { startTimer() }
                }
                .onDisappear {
                    stopTimer()
                }
        }
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if countdown > 0 {
                countdown -= 1
                progress = 100 - (Double(countdown) / 120.0 * 100.0)
            } else {
                resetTimer()
            }
        }
    }
    
    private func resetTimer() {
        countdown = 120
        progress = 0
        startTimer()
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
