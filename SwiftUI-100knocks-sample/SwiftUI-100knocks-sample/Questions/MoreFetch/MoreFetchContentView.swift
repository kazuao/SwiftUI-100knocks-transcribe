//
//  FetchAndScroll.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/03.
//

import SwiftUI
import Combine

struct MoreFetchContentView: View {

    @State private var repositories = [Repository]()
    @State private var page = 1
    @State private var isFetching = false
    @State private var subscriptions = Set<AnyCancellable>()
    @State private var showingAlert = false
    @State private var errorMessage = ""

    var body: some View {

        List(repositories) { repository in
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(Font.system(size: 24).bold())
                Text(repository.description ?? "")
                Text("Star: \(repository.stargazersCount)")
            }
            .onAppear {
                if repositories.last == repository {
                    fetchRepositories()
                }
            }
        }
        .onAppear {
            fetchRepositories()
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage),
                dismissButton: .default(Text("Close")))
        }
    }
}

private extension MoreFetchContentView {

    func fetchRepositories() {
        guard !isFetching else { return }

        isFetching = true

        GithubAPI_Combine.searchRepos(page: page, perPage: 30)
            .sink { completion in

                switch completion {
                case .finished:
                    isFetching = false

                case .failure(let e):
                    isFetching = false
                    showingAlert = true
                    errorMessage = e.localizedDescription
                }

            } receiveValue: { repositories in
                self.repositories += repositories
                page += 1
            }
            .store(in: &subscriptions)

    }
}

struct FetchAndScroll_Previews: PreviewProvider {
    static var previews: some View {
        MoreFetchContentView()
    }
}
