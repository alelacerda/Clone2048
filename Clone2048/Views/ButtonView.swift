//
//  ButtonView.swift
//  Clone2048
//
//  Created by Alessandra Fernandes Lacerda on 11/05/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> ()
    let maxWidth: CGFloat = .infinity
    let maxHeight: CGFloat = .infinity
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 24, weight: .heavy, design: .rounded))
                .foregroundColor(.lightText)
                .frame(maxWidth: maxWidth, maxHeight: maxHeight)
                .background(Color.tile16)
                .cornerRadius(4)
        }
    }
}
