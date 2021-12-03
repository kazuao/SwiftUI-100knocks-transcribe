//
//  Quiz2.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz2: View {
    var body: some View {

        VStack(alignment: .center, spacing: 8) {
            HStack {
                Image("001")
                    .resizable()
                    .frame(width: 42, height: 42)
                Spacer()
                Image("001")
                    .resizable()
                    .frame(width: 42, height: 42)
                Spacer()
                Image("001")
                    .resizable()
                    .frame(width: 42, height: 42)
                Spacer()
                Image("001")
                    .resizable()
                    .frame(width: 42, height: 42)
                Spacer()
                Image("001")
                    .resizable()
                    .frame(width: 42, height: 42)
            }
            .padding(16)
        }
    }
}

struct Quiz2_Previews: PreviewProvider {
    static var previews: some View {
        Quiz2()
    }
}
