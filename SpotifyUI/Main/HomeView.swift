//
//  HomeView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 08/11/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var selectedCategory: Category? = .music
    @State private var topArtists = ["Artist 1", "Artist 2", "Artist 3", "Artist 4"]
    @State private var recentlyPlayed = ["Song 1", "Song 2", "Song 3", "Song 4"]

    @State private var favoritePosters = ["f1", "f2", "f3", "f4", "f5", "f6"]
    @State private var topArtistImages = ["A1", "A2", "A3", "A4"] // Unique images for top artists
    @State private var recentlyPlayedImages = ["r1", "r2", "r3", "r4"] // Unique images for recently played

    // State to trigger navigation
    @State private var navigateToPlaylist = false

    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        header
                        categoryTabs
                        favoritesSection
                        topArtistsSection
                        recentlyPlayedSection
                        topRatedSection
                        todaysBiggestHitSection
                        popularRadioSection
                        indiasBestSection
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }

                // Invisible NavigationLink to trigger the navigation programmatically
                NavigationLink(
                    destination: PlaylistView(),
                    isActive: $navigateToPlaylist
                ) {
                    EmptyView()
                }
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Hi, Spriyha")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .padding(.top, 20)
    }

    private var categoryTabs: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryCell(title: category.rawValue.capitalized, isSelected: category == selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
        }
        .padding(.vertical, 8)
    }

    private var favoritesSection: some View {
        VStack(alignment: .leading) {
            Text("Your Favorites")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 14)

            LazyVGrid(
                columns: [GridItem(.flexible()), GridItem(.flexible())],
                spacing: 5
            ) {
                // Tap the first item to navigate to PlaylistView
                Image(favoritePosters.first ?? "f1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: (UIScreen.main.bounds.width - 40) / 2, height: (UIScreen.main.bounds.height) / 8)
                    .cornerRadius(8)
                    .onTapGesture {
                        navigateToPlaylist = true  // Trigger navigation when tapped
                    }

                // Load the rest of the favoritePosters images
                ForEach(favoritePosters.dropFirst(), id: \.self) { poster in
                    Image(poster)
                        .resizable()
                        .scaledToFill()
                        .frame(width: (UIScreen.main.bounds.width - 40) / 2, height: (UIScreen.main.bounds.height) / 8)
                        .cornerRadius(8)
                }
            }
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(.top, 8)
    }

    private var topArtistsSection: some View {
        VStack(alignment: .leading) {
            Text("Your Top Artists")
                .font(.headline)
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(topArtists.indices, id: \.self) { index in
                        VStack {
                            Image(topArtistImages[index % topArtistImages.count])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())

                            Text(topArtists[index])
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }

    private var recentlyPlayedSection: some View {
        VStack(alignment: .leading) {
            Text("Recently Played")
                .font(.headline)
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(recentlyPlayed.indices, id: \.self) { index in
                        VStack {
                            Image(recentlyPlayedImages[index % recentlyPlayedImages.count])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)

                            Text(recentlyPlayed[index])
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
    private var topRatedSection: some View {
           sectionView(title: "Top Rated", images: ["t1", "t2", "t3", "t4"])
       }

       private var todaysBiggestHitSection: some View {
           sectionView(title: "Today's Biggest Hit", images: ["b1", "b2", "b3", "b4"])
       }

       private var popularRadioSection: some View {
           sectionView(title: "Popular Radio", images: ["rd1", "rd3","rd2","rd5","rd4","rd6"])
       }

       private var indiasBestSection: some View {
           sectionView(title: "India's Best", images: ["i1", "i2", "i3", "i4","i5"])
       }

       private func sectionView(title: String, images: [String]) -> some View {
           VStack(alignment: .leading) {
               Text(title)
                   .font(.headline)
                   .foregroundColor(.white)

               ScrollView(.horizontal, showsIndicators: false) {
                   HStack(spacing: 8) {
                       ForEach(images, id: \.self) { image in
                           VStack {
                               Image(image)
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: 100, height: 100)
                                   .cornerRadius(8)

                               Text("Title")
                                   .font(.caption)
                                   .foregroundColor(.white)
                           }
                       }
                   }
               }
           }
           .padding(.top, 8)
       }
   }



struct CategoryCell: View {
    var title: String
    var isSelected: Bool

    var body: some View {
        Text(title)
            .font(.callout)
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background(isSelected ? Color.green : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(16)
    }
}

enum Category: String, CaseIterable {
    case music, podcasts, shows
}

struct SpotifyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyHomeView()
    }
}
