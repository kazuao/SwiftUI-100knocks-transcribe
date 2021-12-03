//
//  Quiz8.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz8: View {

    @State private var numberString = ""
    @State private var showAlert = false
    @State private var showSheet = false

    var body: some View {
        VStack {
            TextField("Input NUmber", text: $numberString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: showAction) {
                Text("Show Action")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"), dismissButton: .default(Text("Close")))
            }
            .sheet(isPresented: $showSheet) {
                Text("\(numberString) can convert to Double")
            }
        }
    }
}

private extension Quiz8 {
    func showAction() {
        if Double(numberString) != nil {
            showSheet = true
        } else {
            showAlert = true
        }
    }
}

struct Quiz8_Previews: PreviewProvider {
    static var previews: some View {
        Quiz8()
    }
}
