//
//  GFRepoItemVC.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 18.01.2024.
//

import Foundation

//GFItemInfoVC den inheritance aldık
class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
   
}
