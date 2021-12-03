//
//  CardBaseView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct CardBaseView: View {
    var body: some View {
        VStack {
            CardView {
                Text("Snorlax")
            }

            CardView {
                Image("001")
                    .resizable()
                    .frame(width: 60, height: 60)
            }

            CardView(color: Color.red.opacity(0.4)) {
                Text("Red shadow")
            }

            CardView(color: Color.green.opacity(0.4), radius: 24) {
                Text("Big shadow")
            }

            Text("Hogehoge")
                .card()
        }
    }
}

struct CardBaseView_Previews: PreviewProvider {
    static var previews: some View {
        CardBaseView()
    }
}
