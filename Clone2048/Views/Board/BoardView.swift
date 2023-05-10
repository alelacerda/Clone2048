//
//  BoardView.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

import SwiftUI

struct BoardView: View {
    var board: Board
    var body: some View {
        VStack{
            ForEach(0..<self.board.count, id:\.self) { row in
                HStack {
                    ForEach(0..<self.board[row].count, id:\.self) { column in
                        
                        TileView(value: board[row][column])
                    }
                }
            }
        }
        .background(Color.boardBackground)
    }
}
