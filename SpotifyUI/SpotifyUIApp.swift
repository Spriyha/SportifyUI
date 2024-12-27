//
//  spotifyUIApp.swift
//  spotifyUI
//
//  Created by iPHTech34 on 28/10/24.
//

import SwiftUI
@main
struct SpotifyUIApp: App {
    @StateObject private var libraryData = LibraryData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(libraryData)
        }
    }
}
