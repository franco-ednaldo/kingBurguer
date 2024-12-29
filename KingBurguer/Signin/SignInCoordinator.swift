//
//  SignInCoordinator.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class SignInCoordinator {
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let viewModel = SignInViewModel()
        let signInVC = SignInViewController()
        
        viewModel.coordinator = self
        signInVC.viewModel = viewModel
        
        self.navigationController.pushViewController(signInVC, animated: true)
        
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
    }
    
    func signUp() {
        let signUpCoordinator = SignUpCoordinator(navigation: self.navigationController)
        signUpCoordinator.start()
    }
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigation: self.navigationController)
        homeCoordinator.start()
    }
}
