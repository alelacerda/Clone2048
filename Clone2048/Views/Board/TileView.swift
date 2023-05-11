//
//  Tile.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

import SwiftUI

struct TileView: View {
    let value: Int
    private let style: TileStyle
    private let fontSize = 22.0
    private let size = 70.0
    
    init(value: Int) {
        self.value = value
        self.style = TileStyle(value)
    }
    
    var body: some View {
        Text(value == 0 ? " " : "\(self.value)")
            .font(.system(size: self.fontSize, weight: .black, design: .rounded))
            .foregroundColor(self.style.foregroundColor)
            .frame(width: size, height: size)
            .background(style.backgroundColor)
            .cornerRadius(4)
    }
}
