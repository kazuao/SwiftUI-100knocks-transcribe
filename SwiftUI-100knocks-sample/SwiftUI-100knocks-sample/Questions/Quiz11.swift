//
//  Quiz11.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz11: View {
    var body: some View {
        (Text("I ")
            + Text("love ")
                .foregroundColor(Color.red)
            + Text("Snorlax")
                .foregroundColor(Color.black)
                .font(Font.system(size: 20).bold())

            + Text("!\n")
            + Text("Snorlax is most cute & cool& powerful Pokemon.")
            ).lineSpacing(4)
    }
}

struct Quiz11_Previews: PreviewProvider {
    static var previews: some View {
        Quiz11()
            .previewLayout(.sizeThatFits)
    }
}
