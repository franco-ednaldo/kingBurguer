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
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTextView: PlaceholderPaddedTextField = {
        let email = PlaceholderPaddedTextField(padding: UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 0))
        email.backgroundColor = .white
        email.placeholder = "Digite seu e-mail"
        email.translatesAutoresizingMaskIntoConstraints = false
        email.delegate = self
        email.returnKeyType = .next
        email.borderStyle = .roundedRect
       // email.attributedPlaceholder = NSAttributedString(string: "Digite seu e-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        return email
    }()
    
    lazy var passwordTextView: PlaceholderPaddedTextField = {
        let password = PlaceholderPaddedTextField(padding: UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 0))
        password.backgroundColor = .white
        password.placeholder = "Digite sua senha"
        password.translatesAutoresizingMaskIntoConstraints = false
        password.isSecureTextEntry = true
        password.returnKeyType = .done
        password.delegate = self
        password.borderStyle = .roundedRect
        return password
    }()
    
    lazy var signInButton: LoadingButton = {
        let button = LoadingButton()
        button.title = "Entrar"
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tappedSignInButton))
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Criar conta", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
        return button
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationItem.title = "Login"
        
        initLayout()
        addConstraints()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyBoardNotification),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onKeyBoardNotification),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard(_ view: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc private func tappedSignInButton(_ sender: UIButton) {
        viewModel?.send()
    }
    
    @objc private func tappedSignUpButton(_ sender: UIButton) {
        viewModel?.register()
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
        container.addSubview(self.emailTextView)
        container.addSubview(self.passwordTextView)
        container.addSubview(self.signInButton)
        container.addSubview(self.signUpButton)
    }

    private func addConstraints() {
        let scrollContraints = [
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        let heightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor )
               heightConstraint.priority = .defaultLow
               heightConstraint.isActive = true
        
        let containerConstraints = [
            container.widthAnchor.constraint(equalTo: view.widthAnchor),
            container.topAnchor.constraint(equalTo: scrollView.topAnchor),
            container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ]
        
        let emailConstraints = [
            self.emailTextView.topAnchor.constraint(equalTo: container.topAnchor, constant: 300),
            self.emailTextView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 25),
            self.emailTextView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -25),
            self.emailTextView.heightAnchor.constraint(equalToConstant: 48.0),
        ]
        
        let passwordConstraints = [
            self.passwordTextView.leadingAnchor.constraint(equalTo: self.emailTextView.leadingAnchor),
            self.passwordTextView.trailingAnchor.constraint(equalTo: self.emailTextView.trailingAnchor),
            self.passwordTextView.topAnchor.constraint(equalTo: self.emailTextView.bottomAnchor, constant: 15),
            self.passwordTextView.heightAnchor.constraint(equalToConstant: 48.0),
            
        ]
        
        let signInButtonConstraints = [
            self.signInButton.leadingAnchor.constraint(equalTo: self.emailTextView.leadingAnchor),
            self.signInButton.trailingAnchor.constraint(equalTo: self.emailTextView.trailingAnchor),
            self.signInButton.topAnchor.constraint(equalTo: self.passwordTextView.bottomAnchor, constant: 15),
            self.signInButton.heightAnchor.constraint(equalToConstant: 48.0),
        ]
        
        let signUpButtonConstraints = [
            self.signUpButton.leadingAnchor.constraint(equalTo: self.emailTextView.leadingAnchor),
            self.signUpButton.trailingAnchor.constraint(equalTo: self.emailTextView.trailingAnchor),
            self.signUpButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor, constant: 8),
            self.signUpButton.heightAnchor.constraint(equalToConstant: 48.0),
        ]
        
        NSLayoutConstraint.activate(scrollContraints)
        NSLayoutConstraint.activate(containerConstraints)
        NSLayoutConstraint.activate(emailConstraints)
        NSLayoutConstraint.activate(passwordConstraints)
        NSLayoutConstraint.activate(signInButtonConstraints)
        NSLayoutConstraint.activate(signUpButtonConstraints)
        
    }
}

extension SignInViewController: SignInViewModelDelegate {
    
    func viewModelDidChanged(state: SignInState) {
        switch(state) {
        case .none:
            break
        case .loading:
            self.signInButton.startLoading(loading: true)
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

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .done {
            view.endEditing(true)
        } else{
            passwordTextView.becomeFirstResponder()
        }
        return false
    }
}
