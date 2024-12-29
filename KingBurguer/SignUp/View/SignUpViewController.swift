//
//  SignUpViewController.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 28/12/24.
//

import UIKit

class SignUpViewController: UIViewController {

    var viewModel: SignUpViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o nome"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    lazy var IDCardTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o CPF"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o e-mail"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite sua senha"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    lazy var birthDay: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite o nome"
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8.0
        textField.layer.borderColor = UIColor.lightGray.cgColor
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        self.initLayout()
        self.addConstraints()
    }
    
    @objc private func tappedRegister(_ sender: UIButton) {
        self.viewModel?.register()
    }
    
    private func initLayout() {
        view.addSubview(nameTextField)
        view.addSubview(IDCardTextField)
        view.addSubview(passwordTextField)
        view.addSubview(birthDay)
        view.addSubview(emailTextField)
        view.addSubview(registerButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            self.nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            self.nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            self.birthDay.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.birthDay.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.birthDay.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.birthDay.heightAnchor.constraint(equalToConstant: 48),
            
            self.IDCardTextField.topAnchor.constraint(equalTo: self.birthDay.bottomAnchor, constant: 10),
            self.IDCardTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.IDCardTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.IDCardTextField.heightAnchor.constraint(equalToConstant: 48),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.IDCardTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.registerButton.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalToConstant: 48),
            
        ])
    }
}


extension SignUpViewController: SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState) {
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
