//
//  CardView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct CardView<Content>: View where Content: View {

    let color: Color
    let radius: CGFloat
    let content: () -> Content

    init(
        color: Color = .gray.opacity(0.4),
        radius: CGFloat = 8.0,
        @ViewBuilder content: @escaping () -> Content)
    {
        self.color = color
        self.radius = radius
        self.content = content
    }

    var body: some View {
        content()
            .padding()
            .background(.white)
            .cornerRadius(16)
            .shadow(color: color, radius: radius, x: 4, y: 4)
            .padding(radius + 8)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView() {
            Text("Snorlax")
        }
        .previewLayout(.sizeThatFits)
    }
}
