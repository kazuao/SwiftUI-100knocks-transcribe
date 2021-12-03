//
//  GithubAPI.swift
//  SwiftUI-100knocks-sample
//
//  Created by kazunori.aoki on 2021/12/03.
//

import Foundation
import SwiftUI

enum GithubAPI {
    static func searchRepos(page: Int, perPage: Int,
                            completion: @escaping (Result<[Repository], Error>) -> ()) {

        let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars&page=\(page)&per_page=\(perPage)")!
                
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(error))
                return
            }

            do {
                let repositories = try JSONDecoder().decode(GithubSearchResult.self, from: data!).items
                completion(.success(repositories))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
