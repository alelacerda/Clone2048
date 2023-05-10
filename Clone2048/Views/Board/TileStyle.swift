//
//  TileStyle.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 10/05/23.
//

import SwiftUI

enum TileStyle {
    
    case empty, two, four, eight, sixteen, thirtyTwo, sixtyFour, oneHundredTwentyEight, twoHundredFiftySix, fiveHundredTwelve, oneThousandTwentyFour, twoThousandFortyEight, max
    
    init(_ value: Int) {
        switch value {
        case 0: self = .empty
        case 2: self = .two
        case 4: self = .four
        case 8: self = .eight
        case 16: self = .sixteen
        case 32: self = .thirtyTwo
        case 64: self = .sixtyFour
        case 128: self = .oneHundredTwentyEight
        case 256: self = .twoHundredFiftySix
        case 512: self = .fiveHundredTwelve
        case 1024: self = .oneThousandTwentyFour
        case 2048: self = .twoThousandFortyEight
        default: self = .max
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .two, .four: return .darkText
        default: return .lightText
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .empty: return .tileEmpty
        case .two: return .tile2
        case .four: return .tile4
        case .eight: return .tile8
        case .sixteen: return .tile16
        case .thirtyTwo: return .tile32
        case .sixtyFour: return .tile64
        case .oneHundredTwentyEight: return .tile128
        case .twoHundredFiftySix: return .tile256
        case .fiveHundredTwelve: return .tile512
        case .oneThousandTwentyFour: return .tile1024
        case .twoThousandFortyEight: return .tile2048
        case .max: return .tileMax
        }
    }
}
