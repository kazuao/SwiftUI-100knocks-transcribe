//
//  AttributedText.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/01.
//

import UIKit
import SwiftUI

struct AttributedText: UIViewRepresentable {
    typealias UIViewType = UITextView

    var attributedText: NSAttributedString

    init(_ attributedText: NSAttributedString) {
        self.attributedText = attributedText
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = true
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedText
    }
}
