//
//  ContentView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 28/10/24.
//

import SwiftUI
struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @EnvironmentObject var libraryData: LibraryData
        var body: some View {
            VStack(spacing: 0) {
                // Show the selected view based on the selected tab
                switch selectedTab {
                case .home:
                    SpotifyHomeView()
                case .library:
                    LibraryView()
                case .search:
                    SearchView()
                }
                
                // Tab bar at the bottom
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
enum Tab {
        case home, search, library
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
