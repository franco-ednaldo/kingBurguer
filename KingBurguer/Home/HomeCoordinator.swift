//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class HomeCoordinator {
    private let navigationController: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let homeViewModel = HomeViewModel()
        let homeVC = HomeViewController()
        homeVC.viewModel = homeViewModel
        
        self.navigationController.pushViewController(homeVC, animated: true)
    }
}
