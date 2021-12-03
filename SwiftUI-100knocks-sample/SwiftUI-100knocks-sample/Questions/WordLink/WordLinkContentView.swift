//
//  WordLinkContentView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/01.
//

import SwiftUI

struct WordLinkContentView: View {
    var body: some View {
        AttributedText(getAttributeString())
    }

    func getAttributeString() -> NSAttributedString {
        let baseString = """
        This is a sentence that includes a link to the settings app.
        This is a sentence that includes a link to the Google search.
        """

        let attributedString = NSMutableAttributedString(string: baseString)
        attributedString.addAttribute(.link,
                                      value: UIApplication.openSettingsURLString,
                                      range: NSString(string: baseString)
                                        .range(of: "the settings app"))
        attributedString.addAttribute(.link,
                                      value: "https://www.google.co.jp/",
                                      range: NSString(string: baseString)
                                        .range(of: "the Google search"))

        return attributedString
    }
}

struct WordLinkContentView_Previews: PreviewProvider {
    static var previews: some View {
        WordLinkContentView()
    }
}
