//
//  UIHelper.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 18.01.2024.
//

import UIKit

struct UIHelper {
    static  func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        //genişlik - (kenarlarda ki boşluklar * 2) - (itemlerarası boşluk * 2 (itemler arası boşluk))
        let avaibleWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = avaibleWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize =  CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
