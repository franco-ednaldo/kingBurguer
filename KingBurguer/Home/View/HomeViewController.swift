//
//  HomeViewController.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class HomeViewController: UITabBarController {
    
    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.setupTabBar()

    }
    
    private func setupTabBar() {
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let profileVC = UINavigationController(rootViewController:ProfileViewController())
        let couponVC = UINavigationController(rootViewController:CouponViewController())

        tabBar.tintColor = .red
        
        feedVC.tabBarItem.image = UIImage(systemName: "house")
        feedVC.title = "Inicio"
        
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle")
        profileVC.title = "Perfil"
        
        couponVC.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        couponVC.title = "Cupons"
        
        setViewControllers([feedVC, couponVC, profileVC], animated: true)
    }
    
}
