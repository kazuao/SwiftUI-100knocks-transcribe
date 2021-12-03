//
//  ModalView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/01.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.viewController) private var viewControllerHolder: ViewControllerHolder

    private var viewController: UIViewController? {
        return viewControllerHolder.viewController
    }

    var body: some View {
        NavigationView {
            Button(action: {
                viewController?.dismiss(animated: true)
            }) {
                Text("Dismiss")
            }
            .onAppear {
                viewController?.isModalInPresentation = true
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
