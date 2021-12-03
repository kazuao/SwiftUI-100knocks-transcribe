//
//  Quiz9.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz9: View {

    @State private var isActive = false

    var body: some View {

        NavigationView {
            VStack {
                Button(action: changeActive) {
                    Text("Change Active")
                }

                NavigationLink(destination: SecondView(message: "hogehoge"),
                               isActive: $isActive) {
                    EmptyView()
                }
            }
        }
    }
}

private extension Quiz9 {
    func changeActive() {
        isActive = true
    }
}

struct Quiz9_Previews: PreviewProvider {
    static var previews: some View {
        Quiz9()
    }
}
