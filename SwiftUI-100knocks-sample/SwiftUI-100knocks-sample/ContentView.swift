//
//  ContentView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/11/29.
//

import SwiftUI

// ref: https://qiita.com/takoikatakotako/items/0838d1bb7a15ad1edb87

struct ContentView: View {

    var body: some View {

        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    Group {
                        NavigationLink(destination: Quiz1()) {
                            Text("Images")
                        }

                        NavigationLink(destination: Quiz2()) {
                            Text("横並び")
                        }

                        NavigationLink(destination: SecondView(message: "ふがふが")) {
                            Text("値渡し")
                        }

                        NavigationLink(destination: Quiz3()) {
                            Text("Picker")
                        }

                        NavigationLink(destination: Quiz4()) {
                            Text("Tab bar")
                        }

                        NavigationLink(destination: Quiz5()) {
                            Text("Change Text")
                        }

                        NavigationLink(destination: Quiz6()) {
                            Text("Show Alert")
                        }

                        NavigationLink(destination: Quiz7()) {
                            Text("Change Text2")
                        }

                        NavigationLink(destination: Quiz8()) {
                            Text("Action Alert or Sheet")
                        }

                        NavigationLink(destination: Quiz9()) {
                            Text("Button Navigation")
                        }
                    }

                    Group {
                        NavigationLink(destination: Quiz10()) {
                            Text("Show More Button")
                        }

                        NavigationLink(destination: Quiz11()) {
                            Text("Text color change")
                        }

                        NavigationLink(destination: Quiz11()) {
                            Text("Text color change")
                        }

                        NavigationLink(destination: Quiz12()) {
                            Text("List change")
                        }

                        NavigationLink(destination: LikeCollectionView()) {
                            Text("Like Collection View")
                        }

                        NavigationLink(destination:  BeforeScreenProtocol()) {
                            Text("Before screen function")
                        }

                        NavigationLink(destination: LikeCollectionView()) {
                            Text("UIPageViewController bridge")
                        }

                        NavigationLink(destination: Quiz13()) {
                            Text("list alert")
                        }

                        NavigationLink(destination: ModalHolderContentView()) {
                            Text("don't close modal")
                        }

                        NavigationLink(destination: WordLinkContentView()) {
                            Text("word link")
                        }
                    }

                    Group {
                        NavigationLink(destination: GithubApiContentView()) {
                            Text("api request closure")
                        }

                        NavigationLink(destination: GithubApiContentView_combine()) {
                            Text("api request combine")
                        }

                        NavigationLink(destination: MoreFetchContentView()) {
                            Text("api request more fetch")
                        }
                    }
                }
            }
            .navigationTitle("100本ノック")
//            .navigationBarHidden(true) // NavigationBarの非表示
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
