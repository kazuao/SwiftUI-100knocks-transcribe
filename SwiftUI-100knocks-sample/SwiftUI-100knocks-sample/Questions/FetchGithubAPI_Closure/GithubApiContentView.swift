//
//  GithubApiContentView.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/03.
//

import SwiftUI

struct GithubApiContentView: View {

    @State private var repositories = [Repository]()
    @State private var showingAlert = false
    @State private var errorMessage = ""

    var body: some View {
        List(repositories) { repository in
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(.system(size: 24).bold())

                Text(repository.description ?? "")

                Text("Star: \(repository.stargazersCount)")
            }
        }
        .onAppear {
            GithubAPI.searchRepos(page: 1, perPage: 30) { result in
                switch result {
                case .success(let repo):
                    DispatchQueue.main.async {
                        self.repositories = repo
                    }

                case .failure(let e):
                    DispatchQueue.main.async {
                        self.errorMessage = e.localizedDescription
                        self.showingAlert = true
                    }
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"),
                  message: Text(errorMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
}

struct GithubApiContentView_Previews: PreviewProvider {
    static var previews: some View {
        GithubApiContentView()
    }
}
