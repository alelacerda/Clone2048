//
//  ScoreTileView.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 11/05/23.
//

import SwiftUI

struct ScoreTileView: View {
    let title: String
    let score: Int
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 16, weight: .heavy, design: .rounded))
                .foregroundColor(.tile2)
            Text(score.description)
                .font(.system(size: 24, weight: .heavy, design: .rounded))
                .foregroundColor(.lightText)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.boardBackground)
        .cornerRadius(4)
    }
}
