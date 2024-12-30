//
//  SignUpCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class SignUpCoordinator {
    
    private let navigationController: UINavigationController
    
    var parentCoordinator: SignInCoordinator?
    
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
        self.parentCoordinator?.goToHome()
    }
    
}

