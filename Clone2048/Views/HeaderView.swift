//
//  HeaderView.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

import SwiftUI

struct HeaderView: View {
    
    @State var score: Int
    @State var bestScore: Int
    
    var body: some View {
        HStack {
            Text("2048")
                .font(.system(size: 36, weight: .heavy, design: .rounded))
                .foregroundColor(.lightText)
                .frame(width: 120, height: 120)
                .background(Color.tile2048)
                .cornerRadius(4)
            
            VStack(alignment: .center) {
                HStack {
                    ScoreTileView(title: "Score", score: score)
                    ScoreTileView(title: "Best", score: bestScore)
                }
                .frame(maxWidth: .infinity)
                
                ButtonView(title: "Restart") {
                    print("restart")
                }
            }
            .frame(height: 120)
        }
        .frame(width:338)
    }
}



