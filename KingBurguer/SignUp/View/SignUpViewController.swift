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
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        // scroll.backgroundColor = .gray
        return scroll
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        // view.backgroundColor = .red
        return view
    }()
    
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
    
    lazy var registerButton: LoadingButton = {
        let button = LoadingButton()
        button.title = "Salvar"
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tappedRegister))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        self.initLayout()
        self.addConstraints()
    }
    
    @objc private func tappedRegister(_ sender: UIButton) {
        self.viewModel?.register()
    }
    
    private func initLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(nameTextField)
        container.addSubview(emailTextField)
        container.addSubview(IDCardTextField)
        container.addSubview(passwordTextField)
        container.addSubview(birthDay)
        container.addSubview(emailTextField)
        container.addSubview(registerButton)
    }
    
    private func addConstraints() {
        let scrollViewConstraints = [
            self.scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ]
        
        let heightContainer = container.heightAnchor.constraint(equalTo: view.heightAnchor)
        heightContainer.priority = .defaultLow
        heightContainer.isActive =  true
        
        let containerConstraints = [
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            self.container.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.container.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.container.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
        ]
        
        let nameTextFieldConstraints = [
            self.nameTextField.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 60),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 25),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -25),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        let emailTextFieldConstraints = [
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.emailTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        ]
        
        let birthDayConstraints = [
            self.birthDay.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.birthDay.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.birthDay.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.birthDay.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        ]
        
        let IDCardTextFieldConstraints = [
            self.IDCardTextField.topAnchor.constraint(equalTo: self.birthDay.bottomAnchor, constant: 10),
            self.IDCardTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.IDCardTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.IDCardTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        ]
        
        let passwordTextFieldConstraints = [
            self.passwordTextField.topAnchor.constraint(equalTo: self.IDCardTextField.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        ]
        
        let registerButtonConstraints = [
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.registerButton.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.nameTextField.heightAnchor),
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(containerConstraints)
        NSLayoutConstraint.activate(nameTextFieldConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(birthDayConstraints)
        NSLayoutConstraint.activate(IDCardTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
        
        //        NSLayoutConstraint.activate([
        //
        //
        //
        //

        

        

        

        //
        //        ])
    }
}


extension SignUpViewController: SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState) {
        switch(state) {
        case .none:
            break
        case .loading:
            self.registerButton.startLoading(loading: true)
            break
        case .goToHome:
            self.registerButton.startLoading(loading: false)
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
