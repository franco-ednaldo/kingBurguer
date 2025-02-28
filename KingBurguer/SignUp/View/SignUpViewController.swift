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
    
    lazy var nameTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Digite o nome"
        textField.returnKeyType = .next
        textField.delegate = self
        textField.tag = 1
        textField.error = "Nome inválido!"
        textField.failure = {
            return !textField.text.isEmail()
        }
        return textField
    }()
    
    lazy var emailTextField: TextField = {
        let textField = TextField()
        textField.backgroundColor = .white
        textField.placeholder = "Digite o e-mail"
        textField.returnKeyType = .next
        textField.tag = 2
        textField.delegate = self
        textField.keyBoardType = .emailAddress
        textField.error = "e-mail inválido!"
        textField.failure = {
            return textField.text.count <= 10
        }
        return textField
    }()
    
    lazy var IDCardTextField: TextField = {
        let textField = TextField()
        textField.backgroundColor = .white
        textField.placeholder = "Digite o CPF"
        textField.returnKeyType = .next
        textField.delegate = self
        textField.tag = 3
        textField.error = "CPF inválido!"
        textField.failure = {
            return textField.text.count != 14
        }
        return textField
    }()
    
    lazy var birthDay: TextField = {
        let textField = TextField()
        textField.backgroundColor = .white
        textField.placeholder = "Digite data de nascimento"
        textField.returnKeyType = .next
        textField.tag = 4
        textField.error = "Data inválida!"
        textField.failure = {
            return textField.text.count < 10
        }

        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: TextField = {
        let textField = TextField()
        textField.backgroundColor = .white
        textField.placeholder = "Digite sua senha"
        textField.returnKeyType = .done
        textField.delegate = self
        textField.tag = 5
        textField.error = "Senha inválida!"
        textField.failure = {
            return textField.text.count <= 3
        }
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
        view.backgroundColor = .systemBackground
        
        self.initLayout()
        self.addConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyBoardNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyBoardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc private func tappedRegister(_ sender: UIButton) {
        self.viewModel?.register()
    }
    
    @objc private func onKeyBoardNotification(_ notification: Notification) {
        let isVisible = notification.name == UIResponder.keyboardWillShowNotification
        let keyBoardFrame = isVisible ? UIResponder.keyboardFrameEndUserInfoKey : UIResponder.keyboardFrameBeginUserInfoKey
        
        if let keyBoardSize = (notification.userInfo?[keyBoardFrame] as? NSValue)?.cgRectValue {
            onkeyBoardChanged(isVisible, height: keyBoardSize.height)
        }
    }
    
    private func onkeyBoardChanged(_ visible: Bool, height: CGFloat) {
        if !visible {
            self.scrollView.contentInset = .zero
            self.scrollView.scrollIndicatorInsets = .zero
        } else {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
        }
    }
    
    
    private func initLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        container.addSubview(nameTextField)
        container.addSubview(emailTextField)
        container.addSubview(IDCardTextField)
        container.addSubview(birthDay)
        container.addSubview(passwordTextField)
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
        ]
        
        let emailTextFieldConstraints = [
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 10),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
        ]
        
        let IDCardTextFieldConstraints = [
            self.IDCardTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 10),
            self.IDCardTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.IDCardTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
        ]
        
        let birthDayConstraints = [
            self.birthDay.topAnchor.constraint(equalTo: self.IDCardTextField.bottomAnchor, constant: 10),
            self.birthDay.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.birthDay.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
        ]

        
        let passwordTextFieldConstraints = [
            self.passwordTextField.topAnchor.constraint(equalTo: self.birthDay.bottomAnchor, constant: 10),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
            
        ]
        
        let registerButtonConstraints = [
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 10),
            self.registerButton.leadingAnchor.constraint(equalTo: self.nameTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.nameTextField.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(containerConstraints)
        NSLayoutConstraint.activate(nameTextFieldConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(birthDayConstraints)
        NSLayoutConstraint.activate(IDCardTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
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

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .done {
            view.endEditing(true)
            print("Save!")
        }
        
        let nextTag = textField.tag + 1
        let component = container.findViewById(tag: nextTag) as? TextField
        if let field = component {
            field.gainFocus()
        } else {
            view.endEditing(true)
        }
        return false
    }
}

extension UIView {
    func findViewById(tag: Int) -> UIView? {
        for view in subviews {
            if view.tag == tag {
                return view
            }
        }
        return nil
    }
}
