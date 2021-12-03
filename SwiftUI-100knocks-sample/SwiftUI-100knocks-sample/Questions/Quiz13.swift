//
//  Quiz13.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/30.
//

import SwiftUI

fileprivate struct Pokemon2: Identifiable {
    let id = UUID()
    let name: String
}


struct Quiz13: View {

    @State private var pokemons: [Pokemon2] = [
        Pokemon2(name: "カビゴン"),
        Pokemon2(name: "ピカチュー"),
        Pokemon2(name: "コダック"),
        Pokemon2(name: "カメックス"),
        Pokemon2(name: "ヤドン")
    ]

    @State private var showingAlert = false

    var body: some View {
        List(pokemons) { pokemon in
            Button(action: { showingAlert = true }) {
                Text(pokemon.name)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("ポケモン名"),
                      message: Text(pokemon.name),
                      dismissButton: .default(Text("Close")))
            }
        }
    }
}


struct Quiz13_Previews: PreviewProvider {
    static var previews: some View {
        Quiz13()
    }
}
