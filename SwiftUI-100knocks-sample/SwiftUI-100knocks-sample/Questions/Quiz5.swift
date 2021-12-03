//
//  Quiz5.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz5: View {

    @State private var text = "hogehoge"

    var body: some View {
        VStack(spacing: 20) {
            Text(text)

            Button(action: changeText) {
                Text("Change Text")
            }
        }

    }
}

private extension Quiz5 {
    func changeText() {
        text = "fugafuga"
    }
}

struct Quiz5_Previews: PreviewProvider {
    static var previews: some View {
        Quiz5()
    }
}
