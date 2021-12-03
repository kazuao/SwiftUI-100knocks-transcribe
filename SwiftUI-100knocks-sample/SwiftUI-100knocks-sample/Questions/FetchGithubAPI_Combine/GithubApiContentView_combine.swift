//
//  GithubApiContentView_combine.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/03.
//

import SwiftUI
import Combine

struct GithubApiContentView_combine: View {

    @State private var repositories = [Repository]()
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var showingAlert = false
    @State private var errorMessage = ""

    var body: some View {
        List(repositories) { repository in
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(Font.system(size: 24).bold())
                Text(repository.description ?? "")
                Text("Start: \(repository.stargazersCount)")
            }
        }
        .onAppear {
            GithubAPI_Combine.searchRepos(page: 1, perPage: 30)
                .sink(receiveCompletion: { completion in

                    switch completion {
                    case .finished:
                        break

                    case .failure(let e):
                        showingAlert = true
                        errorMessage = e.localizedDescription
                    }

                }) { repositories in
                    self.repositories = repositories
                }
                .store(in: &subscriptions)
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage),
                dismissButton: .default(Text("Close")))
        }
    }
}

struct GithubApiContentView_combine_Previews: PreviewProvider {
    static var previews: some View {
        GithubApiContentView_combine()
    }
}
