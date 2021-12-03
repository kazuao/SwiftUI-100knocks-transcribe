//
//  Quiz4.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz4: View {
    var body: some View {

        TabView {
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }

            Text("The Second Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }

            Text("The Third Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
    }
}

struct Quiz4_Previews: PreviewProvider {
    static var previews: some View {
        Quiz4()
    }
}
