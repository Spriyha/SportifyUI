//
//  SearchView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 11/11/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    
//    var body: some View {
//        VStack {
//            TextField("Search...", text: $searchText)
//                .padding()
//                .background(Color.white)
//                .cornerRadius(8)
//                .padding(.horizontal)
//                .padding(.vertical)
//        }
//        .background(Color.black.edgesIgnoringSafeArea(.all))
//    }
    var body: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all) // Ensures the entire background is black

                VStack {
                    TextField("Search...", text: $searchText)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
            }
        }
   
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
