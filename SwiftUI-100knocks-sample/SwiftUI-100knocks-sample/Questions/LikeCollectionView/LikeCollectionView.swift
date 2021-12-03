//
//  LikeCollectionView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

struct Pokemon: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct PokemonCell: View {
    let pokemon: Pokemon

    var body: some View {
        ZStack {
            Image(pokemon.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)

            VStack {
                Spacer()

                Text(pokemon.name)
                    .font(.system(size: 20).bold())
                    .frame(maxWidth: .infinity, maxHeight: 32)
                    .background(.gray)
                    .foregroundColor(.white)
                    .opacity(0.8)
            }
        }
    }
}

struct LikeCollectionView: View {
    let columns: Int = 3
    let pokemons = [
        Pokemon(name: "カビゴン", imageName: "snorlax"),
        Pokemon(name: "ゲンガー", imageName: "gengar"),
        Pokemon(name: "ヌオー", imageName: "quagsire"),
        Pokemon(name: "コイル", imageName: "magnemite"),
        Pokemon(name: "ミニリュウ", imageName: "dratini"),
        Pokemon(name: "ヤドン", imageName: "slowpoke"),
        Pokemon(name: "コダック", imageName: "psyduck"),
    ]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                ForEach(0..<pokemons.count / columns) { rowIndex in
                    HStack {
                        ForEach(0..<columns) { columnIndex in
                            getPokemonCell(
                                pokemon: getPokemon(rowIndex: rowIndex, columnIndex: columnIndex),
                                width: cellWidth(width: geometry.size.width),
                                height: cellHeight(width: geometry.size.width))
                        }
                    }
                }

                if (pokemons.count % columns > 0) {
                    HStack {
                        ForEach(0..<pokemons.count % columns) { lastColumnIndex in
                            getPokemonCell(pokemon: getPokemon(lastColumnIndex: lastColumnIndex),
                                           width: cellWidth(width: geometry.size.width),
                                           height: cellHeight(width: geometry.size.width))
                        }
                        Spacer()
                    }
                }
            }
        }
        .padding()
    }
}

private extension LikeCollectionView {
    func getPokemon(rowIndex: Int, columnIndex: Int) -> Pokemon {
        return pokemons[columns * rowIndex + columnIndex]
    }

    func getPokemon(lastColumnIndex: Int) -> Pokemon {
        return pokemons[columns * (pokemons.count / columns) + lastColumnIndex]
    }

    func cellWidth(width: CGFloat) -> CGFloat {
        return width / CGFloat(columns)
    }

    func cellHeight(width: CGFloat) -> CGFloat {
        return cellWidth(width: width) * 1.5
    }

    func getPokemonCell(pokemon: Pokemon, width: CGFloat, height: CGFloat) -> AnyView {
        return AnyView(PokemonCell(pokemon: pokemon)
                        .frame(width: width, height: height)
                        .border(.black, width: 2)
                        .clipped())

    }
}

struct LikeCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        LikeCollectionView()
    }
}
