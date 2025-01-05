//
//  SignInViewModel.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//
import Foundation

protocol SignInViewModelDelegate {
    func viewModelDidChanged(state: SignInState)
}

class SignInViewModel {
    var delegate: SignInViewModelDelegate?
    var coordinator: SignInCoordinator?
    
    var state: SignInState = .none {
        didSet {
            self.delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send() {
        self.state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .goToHome
        }
    }
    
    func register() {
        self.coordinator?.signUp()
    }
    
    func goToHome() {
        self.coordinator?.goToHome()
    }
}

