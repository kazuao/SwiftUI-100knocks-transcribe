//
//  GithhubAPI_combine.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/03.
//

import Foundation
import Combine

enum GithubAPI_Combine {
    static func searchRepos(page: Int, perPage: Int) -> AnyPublisher<[Repository], Error> {

        let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
                
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { try JSONDecoder().decode(GithubSearchResult.self, from: $0.data).items }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
