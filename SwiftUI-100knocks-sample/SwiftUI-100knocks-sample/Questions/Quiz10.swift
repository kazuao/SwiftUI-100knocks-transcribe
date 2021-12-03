//
//  Quiz10.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz10: View {
    
    private let aliceInWonderland = "Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, “and what is the use of a book,” thought Alice “without pictures or conversations?”\nSo she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.\nThere was nothing so very remarkable in that; nor did Alice think it so very much out of the way to hear the Rabbit say to itself, “Oh dear! Oh dear! I shall be late!” (when she thought it over afterwards, it occurred to her that she ought to have wondered at this, but at the time it all seemed quite natural); but when the Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then hurried on, Alice started to her feet, for it flashed across her mind that she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take out of it, and burning with curiosity, she ran across the field after it, and fortunately was just in time to see it pop down a large rabbit-hole under the hedge."
    
    var body: some View {
        ScrollView {
            VStack {
                ShowMoreView(text: aliceInWonderland)
            }
        }
    }
}

struct ShowMoreView: View {
    @State var text: String
    @State private var isFirst = true
    @State private var isFold = false
    @State private var needFoldButton = true
    @State private var textHeight: CGFloat? = nil
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text(text)
                    .frame(height: textHeight)
                    .background(GeometryReader{ geometry in
                        Color.clear.preference(key: SizePreference.self, value: geometry.size)
                    })
                    .padding()
                    .onPreferenceChange(SizePreference.self) { textSize in
                        if isFirst == true {
                            if textSize.height > 80 {
                                textHeight = 80
                                isFold = true
                                isFirst = false
                            } else {
                                needFoldButton = false
                            }
                        }
                    }
                
                Spacer()
            }
            
            if needFoldButton {
                Button(action: {
                    isFold.toggle()
                    
                    if isFold == true {
                        textHeight = 80
                    } else {
                        textHeight = nil
                    }
                }) {
                    Text(isFold ? "More" : "Fold")
                }
                .padding(.trailing, 8)
            }
            
        }
    }
}

fileprivate struct SizePreference: PreferenceKey {
    static let defaultValue: Value = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

struct Quiz10_Previews: PreviewProvider {
    static var previews: some View {
        Quiz10()
    }
}
