//
//  PlaybackViewModel.swift
//  spotifyUI
//
//  Created by iPHTech34 on 12/11/24.
//

import SwiftUI


// ViewModel for managing playback state and progress
class PlaybackViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var countdown: Int = 120
    var timer: Timer?
    
    func togglePlayback() {
        isPlaying.toggle()
        if isPlaying {
            startTimer()
        } else {
            stopTimer()
        }
    }
    
    func startTimer() {
        stopTimer()  // Ensure existing timer is canceled
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.countdown > 0 {
                self.countdown -= 1
                self.progress = 100 - (Double(self.countdown) / 120.0 * 100.0)
            } else {
                self.resetTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        countdown = 120
        progress = 0
        startTimer()
    }
}
