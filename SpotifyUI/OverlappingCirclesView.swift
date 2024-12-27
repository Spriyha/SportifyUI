//
//  OverlappingCirclesView.swift
//  spotifyUI
//
//  Created by iPHTech34 on 05/11/24.
//

import SwiftUI

struct OverlappingCirclesView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.yellow)
                .frame(width: 150, height: 150)
                .offset(x: 50, y: -30)
            Circle()
                .fill(Color.orange.opacity(0.7))
                .frame(width: 150, height: 150)
                .offset(x: -30, y: 40)
        }
    }
}
