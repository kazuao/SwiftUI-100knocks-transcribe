//
//  Spinner.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/03.
//

import UIKit
import SwiftUI

struct Spinner: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        return spinner
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) { }
}
