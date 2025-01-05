//
//  HomeCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class HomeCoordinator {
    private let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let homeViewModel = HomeViewModel()
        let homeVC = HomeViewController()
        homeVC.viewModel = homeViewModel
        
        self.window?.rootViewController = homeVC
    }
}
