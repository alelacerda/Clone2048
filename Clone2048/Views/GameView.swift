//
//  ContentView.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

import SwiftUI

enum Direction{
    case up, down, left, right, none
}

struct GameView: View {
    @StateObject var model = GameModel()
    let engine = GameEngine()
    
    // Drag Gesture Variables
    @State var direction: Direction = .none
    let detectDirectionalDrags = DragGesture(minimumDistance: 3.0, coordinateSpace: .local)

    var body: some View {
        VStack {
            HeaderView(score: model.score, bestScore:
                        model.bestScore)
                .padding(.bottom)
            BoardView(board: model.board)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gameBackground)
        .gesture(DragGesture()
            .onEnded { value in
                print(value.translation)
                
                if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30 {
                    self.direction = .left
                    print("left")
                }
                else if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30 {
                    self.direction = .right
                    print("right")
                }
                else if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
                    self.direction = .up
                }
                else if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
                    self.direction = .down
                }
                else {
                    self.direction = .none
                }
                
                model.board = engine.moveBoard(direction: self.direction, board: model.board)
            })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
