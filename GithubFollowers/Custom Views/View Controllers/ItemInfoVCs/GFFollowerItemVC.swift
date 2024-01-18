//
//  GFFollowerItemVC.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 18.01.2024.
//

import Foundation

//GFItemInfoVC den inheritance aldık
class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}
