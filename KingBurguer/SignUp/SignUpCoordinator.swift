//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class SignUpCoordinator {
    
    private let navigationController: UINavigationController
    
    private let window: UIWindow?
    
    init(navigation: UINavigationController, window: UIWindow?) {
        self.navigationController = navigation
        self.window = window
    }
    
    func start() {
        let viewModel = SignUpViewModel()
        viewModel.coordinator = self
        
        let signUpVC = SignUpViewController()
        signUpVC.viewModel = viewModel
        
        self.navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(window: self.window)
        homeCoordinator.start()
    }
    
}

