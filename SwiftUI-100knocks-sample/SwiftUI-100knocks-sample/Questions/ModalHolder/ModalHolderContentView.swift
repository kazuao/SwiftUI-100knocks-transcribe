//
//  ModalHolderContentView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/01.
//

import SwiftUI

struct ModalHolderContentView: View {
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder
    @State private var isPresented = false

    private var viewController: UIViewController? {
        return viewControllerHolder.viewController
    }

    var body: some View {
        VStack {
            Button(action: { isPresented = true }) {
                Text("Show Modal")
            }
            .sheet(isPresented: $isPresented) {
                ModalView()
            }
        }
    }
}

struct ModalHolderContentView_Previews: PreviewProvider {
    static var previews: some View {
        ModalHolderContentView()
    }
}
