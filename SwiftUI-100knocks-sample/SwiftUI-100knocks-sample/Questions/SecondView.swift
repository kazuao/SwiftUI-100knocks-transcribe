//
//  SecondView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct SecondView: View {

    let message: String

    var body: some View {
        Text(message)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(message: "ほげほげ")
    }
}
