//
//  TutorialContentView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/30.
//

import SwiftUI

struct TutorialContentView: View {
    @State var views = [
        TutorialView(imageName: "snorlax", text: "First"),
        TutorialView(imageName: "pikachu", text: "Second"),
        TutorialView(imageName: "slowpoke", text: "Third"),
        TutorialView(imageName: "coil", text: "Fourth"),
    ]

    var body: some View {
        PageView(views)
            .background(.gray)
            .edgesIgnoringSafeArea(.all)
    }
}

struct TutorialContentView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialContentView()
    }
}
