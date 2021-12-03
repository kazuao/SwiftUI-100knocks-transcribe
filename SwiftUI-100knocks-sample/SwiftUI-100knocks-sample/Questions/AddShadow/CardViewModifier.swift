//
//  CardViewModifier.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    let color: Color
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}

extension View {
    func card(color: Color = .gray.opacity(0.4), radius: CGFloat = 8) -> some View {
        modifier(CardViewModifier(color: color, radius: radius))
    }
}

struct CardViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Snorlax")
            .card()
            .previewLayout(.sizeThatFits)
    }
}
