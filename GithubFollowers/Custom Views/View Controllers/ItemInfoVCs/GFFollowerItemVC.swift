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
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
}
