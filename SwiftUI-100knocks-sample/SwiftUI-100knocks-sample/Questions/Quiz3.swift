//
//  Quiz3.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Quiz3: View {

    var pokemons = ["Snorlax", "Pikachu", "Slowpoke", "Meowth"]
    @State private var selectedPokemon = 0

    var body: some View {
        Picker("Pokemon", selection: $selectedPokemon) {
            ForEach(0..<pokemons.count) {
                Text(pokemons[$0])
            }
        }
        .pickerStyle(WheelPickerStyle())
        .onReceive([selectedPokemon].publisher.first()) { pokemon in
            print("selected pokemon: \(pokemon)")
            print(pokemons[pokemon])
        }
    }
}

struct Quiz3_Previews: PreviewProvider {
    
    static var previews: some View {
        Quiz3()
    }
}
