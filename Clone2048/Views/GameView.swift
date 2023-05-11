//
//  ContentView.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

import SwiftUI

struct GameView: View {
    var board = [[0,0,0,4], [0,0,2,16], [2,16,32,4], [32,128,64,8]]
    
    var body: some View {
        VStack {
            HeaderView()
                .padding(.bottom)
            BoardView(board: board)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gameBackground)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
