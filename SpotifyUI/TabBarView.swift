//
//  TabBarView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 05/11/24.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Image(systemName: "house.fill")
                    .foregroundColor(selectedTab == .home ? .white : .gray)
                Text("Home")
                    .font(.footnote)
                    .foregroundColor(selectedTab == .home ? .white : .gray)
            }
            .onTapGesture {
                selectedTab = .home
            }
            
            Spacer()
            
            VStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(selectedTab == .search ? .white : .gray)
                Text("Search")
                    .font(.footnote)
                    .foregroundColor(selectedTab == .search ? .white : .gray)
            }
            .onTapGesture {
                selectedTab = .search
            }
            
            Spacer()
            
            VStack {
                Image(systemName: "rectangle.stack.fill")
                    .foregroundColor(selectedTab == .library ? .white : .gray)
                Text("Your Library")
                    .font(.footnote)
                    .foregroundColor(selectedTab == .library ? .white : .gray)
            }
            .onTapGesture {
                selectedTab = .library
            }
            
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.black.opacity(0.9))
    }
}
