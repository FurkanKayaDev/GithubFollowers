//
//  FollowerListVC.swift
//  GithubFollowers
//
//  Created by Furkan Kaya on 17.01.2024.
//

import UIKit

class FollowerListVC: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String!
    var followers: [Follower] = []
    
    var collectionView : UICollectionView!
    var dataSource : UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureViewController()
        getFollowers()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: "FollowerCell")
    }
    
    func getFollowers() {
        //   weak self kullanmamızın sebebi self içerisinde bir closure kullanıyoruz ve closure içerisinde self'e erişiyoruz. Bu durumda self'i weak yapmazsak closure içerisinde self'e eriştiğimizde self'i yakalayıp hafızada tutmaya çalışacak ve bu durumda da hafıza sızıntısı oluşacaktır. Bu durumda self'i weak yaparak hafızada tutmamasını sağlıyoruz.
        NetworkManager.shared.getFollowers(username: username, page: 1) {[weak self] result in
            guard let self = self else {return}
            
            switch result {
            case.success(let followers):
                self.followers = followers
                self.updateData()
            case.failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseId, for: indexPath) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers)
        DispatchQueue.main.async {self.dataSource.apply(snapShot, animatingDifferences: true)}
    }
}
