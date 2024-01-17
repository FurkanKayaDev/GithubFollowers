//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 17.01.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    
    private init() {
        
    }
    
    func getFollowers(username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                        completed(.failure(.invalidData))
                return
            }
            do {
                // örneğin avatar_url parametresini avatarUrl ye kaydetmek istediğimiz için keyDecodingStrategy kullandık
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch{
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
