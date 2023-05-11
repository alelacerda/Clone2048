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
    var board = [[0,0,0,4], [0,0,2,16], [2,16,32,4], [32,128,64,8]]
    
    // Drag Gesture Variables
    @State var direction: Direction = .none
    let detectDirectionalDrags = DragGesture(minimumDistance: 3.0, coordinateSpace: .local)

    var body: some View {
        VStack {
            HeaderView()
                .padding(.bottom)
            BoardView(board: board)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gameBackground)
        .gesture(DragGesture()
            .onEnded { value in
                print(value.translation)
                
                if value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30 {
                    self.direction = .left
                    print("left swipe")
                }
                else if value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30 {
                    self.direction = .right
                    print("right swipe")
                }
                else if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
                    self.direction = .up
                    print("up swipe")
                }
                else if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
                    self.direction = .down
                    print("down swipe")
                }
                else {
                    self.direction = .none
                    print("no clue")
                }
            })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
