//
//  GameModel.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 12/05/23.
//

import SwiftUI

class GameModel: ObservableObject {
    @Published var board: Board = [[2,0,0,0],[0,2,0,0],[0,0,0,0],[0,0,0,0]]

    @Published var score: Int = 0
    @Published var bestScore: Int = 0
    
}
