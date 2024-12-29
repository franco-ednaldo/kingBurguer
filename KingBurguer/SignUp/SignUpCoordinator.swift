//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class SignUpCoordinator {
    
    private let navigationController: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func start() {
        let viewModel = SignUpViewModel()
        viewModel.coordinator = self
        
        let signUpVC = SignUpViewController()
        signUpVC.viewModel = viewModel
        
        self.navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigation: self.navigationController)
        homeCoordinator.start()
    }
    
}

