//
//  FavoritesListVC.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 17.01.2024.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        
        persistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                print(favorites)
            case.failure(let error):
                break
            }
        }
    }

}
