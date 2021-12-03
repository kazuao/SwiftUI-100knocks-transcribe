//
//  ImageQuiz.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz1: View {
    var body: some View {

        VStack(alignment: .center, spacing: 8) {
            /*
             画像をリサイズして表示（fit）
             150✖︎200サイズに画像をリサイズして表示させてください。
             アスペクト比が異なる場合は余白を赤色で表示してください。
             */
            Image("001")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 200)
                .background(.red)

            /*
             画像をリサイズして表示（clip）
             150✖︎200サイズに画像をリサイズして表示させてください。
             アスペクト比が異なる場合ははみ出た箇所を切り取って表示してください。
             */
            Image("001")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 200)
                .clipped()
                .background(.red)

            /*
             画像を丸く切り取り、枠を付ける
             150✖︎150サイズに画像をリサイズし、丸く切り取り、黒い枠を付けて表示させてください。
             */
            Image("001")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(150 / 2)
                .overlay(RoundedRectangle(cornerRadius: 150 / 2)
                            .stroke(.black, lineWidth: 4))
        }
    }
}

struct ImageQuiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz1()
    }
}
