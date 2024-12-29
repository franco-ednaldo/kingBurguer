//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class HomeCoordinator {
    private let window: UIWindow?
    
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let homeViewModel = HomeViewModel()
        let homeVC = HomeViewController()
        homeVC.viewModel = homeViewModel
        
        self.navigationController.pushViewController(homeVC, animated: true)
        
        self.window?.rootViewController = self.navigationController
    }
}
