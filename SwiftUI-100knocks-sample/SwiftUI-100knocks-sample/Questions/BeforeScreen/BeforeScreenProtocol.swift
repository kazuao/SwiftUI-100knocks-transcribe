//
//  BeforeScreenProtocol.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

protocol MyProtocol {
    func myFunc()
}

struct BeforeScreenProtocol: View, MyProtocol {

    @State var text = "My Text"

    var body: some View {
        NavigationView {
            VStack {
                Text(text)
                NavigationLink(destination: SecondView2(delegate: self)) {
                    Text("2nd View")
                }
            }
        }
    }

    func myFunc() {
        text = "Changed Text"
    }
}

struct SecondView2: View {
    var delegate: MyProtocol

    var body: some View {
        Button(action: { delegate.myFunc() }) {
            Text("Change Text")
        }
    }
}

struct BeforeScreenProtocol_Previews: PreviewProvider {
    static var previews: some View {
        BeforeScreenProtocol()
    }
}
