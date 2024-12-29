//
//  SignInViewController.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 27/12/24.
//

import UIKit

class SignInViewController: UIViewController {
    
    var viewModel: SignInViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    let emailTextView: UITextField = {
        let email = UITextField()
        email.backgroundColor = .white
        email.placeholder = "Digite seu e-mail"
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let passwordTextView: UITextField = {
        let password = UITextField()
        password.backgroundColor = .white
        password.placeholder = "Digite sua senha"
        password.translatesAutoresizingMaskIntoConstraints = false
        password.isSecureTextEntry = true
        return password
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue.withAlphaComponent(0.7)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Criar conta", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        return button
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Login"
        
        initLayout()
        addConstraints()
    }

    
    @objc private func tappedSignInButton(_ sender: UIButton) {
        viewModel?.send()
    }
    
    @objc private func tappedSignUpButton(_ sender: UIButton) {
        viewModel?.register()
    }
    
    private func initLayout() {
        view.addSubview(self.emailTextView)
        view.addSubview(self.passwordTextView)
        view.addSubview(self.signInButton)
        view.addSubview(self.signUpButton)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.emailTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            self.emailTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            self.emailTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            self.emailTextView.heightAnchor.constraint(equalToConstant: 48.0),
            
            self.passwordTextView.leadingAnchor.constraint(equalTo: self.emailTextView.leadingAnchor),
            self.passwordTextView.trailingAnchor.constraint(equalTo: self.emailTextView.trailingAnchor),
            self.passwordTextView.topAnchor.constraint(equalTo: self.emailTextView.bottomAnchor, constant: 8),
            self.passwordTextView.heightAnchor.constraint(equalToConstant: 48.0),
            
            self.signInButton.leadingAnchor.constraint(equalTo: self.emailTextView.leadingAnchor),
            self.signInButton.trailingAnchor.constraint(equalTo: self.emailTextView.trailingAnchor),
            self.signInButton.topAnchor.constraint(equalTo: self.passwordTextView.bottomAnchor, constant: 8),
            self.signInButton.heightAnchor.constraint(equalToConstant: 48.0),
            
            self.signUpButton.leadingAnchor.constraint(equalTo: self.emailTextView.leadingAnchor),
            self.signUpButton.trailingAnchor.constraint(equalTo: self.emailTextView.trailingAnchor),
            self.signUpButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 8),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 48.0),
        ])
    }
}

extension SignInViewController: SignInViewModelDelegate {
    
    func viewModelDidChanged(state: SignInState) {
        switch(state) {
        case .none:
            break
        case .loading:
            break
        case .goToHome:
            self.viewModel?.goToHome()
            break
        case .error(let msg):
            let alert = UIAlertController(title: "Titulo", message: msg, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
            break
        }
    }
    
}
