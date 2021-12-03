//
//  Quiz7.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz7: View {

    @State private var text = "Snorlax"

    var body: some View {
        VStack {
            Text(text)

            Button(action: changeText) {
                HStack {
                    Image("001")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)

                    Text("Tap")
                }
                .padding()
                .border(.gray, width: 2)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

private extension Quiz7 {
    func changeText() {
        text = "Forever"
    }
}

struct Quiz7_Previews: PreviewProvider {
    static var previews: some View {
        Quiz7()
    }
}
