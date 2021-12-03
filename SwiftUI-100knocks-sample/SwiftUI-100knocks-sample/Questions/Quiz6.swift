//
//  Quiz6.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz6: View {

    @State private var showAlert = false

    var body: some View {

        Button(action: { showAlert = true }) {
            Text("Alert")
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("タイトル"),
                  message: Text("メッセージ"),
                  primaryButton: .default(Text("OK")) { print("OK") },
                  secondaryButton: .destructive(Text("cancel")) { print("Cancel") })
        }
    }
}

struct Quiz6_Previews: PreviewProvider {
    static var previews: some View {
        Quiz6()
    }
}
