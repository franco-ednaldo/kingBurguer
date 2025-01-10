import UIKit

class TextField: UIView {
    
    
    var textFieldTag: Int? {
        willSet {
            self.textField.tag = newValue ?? 1
        }
    }
    
    var isSecureTextEntry: Bool? {
        willSet {
            self.textField.isSecureTextEntry = newValue ?? false
        }
    }
    var placeholder: String? {
        willSet {
            self.textField.placeholder = newValue
        }
    }
    
    var error: String?
    
    var returnKeyType: UIReturnKeyType = .next {
        willSet {
            self.textField.returnKeyType = newValue
        }
    }
    
    var heightConstraint: NSLayoutConstraint!
    
    var text: String {
        get {
            return self.textField.text!
        }
    }
    
    var keyBoardType: UIKeyboardType = .default {
        willSet {
            if newValue == .emailAddress {
                self.textField.autocapitalizationType = .none
            }
            self.textField.keyboardType = newValue
        }
    }
    
    override var tag: Int {
        willSet {
            super.tag = newValue
            textField.tag = newValue
        }
    }
    
    var failure: ( () -> Bool )?
    
    var delegate: UITextFieldDelegate? {
        willSet {
            self.textField.delegate = newValue
        }
    }
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        return textField
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.addConstraints()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func gainFocus() {
        self.textField.becomeFirstResponder()
    }
    
    @objc private func textFieldDidChange(_ sender: UITextField) {
        guard let failure = self.failure else { return }
        
        if let value = sender.text {
            if failure() {
                errorLabel.text = error
                self.heightConstraint.constant = 70
            } else {
                errorLabel.text = ""
                self.heightConstraint.constant = 50
            }
        }
        // forca aplicacao dinamica de constraint
        layoutIfNeeded()
    }
    
    private func setupView() {
        addSubview(textField)
        addSubview(errorLabel)
    }
    
    private func addConstraints() {
        let textFieldConstraints = [
            self.textField.topAnchor.constraint(equalTo: topAnchor),
            self.textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.textField.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        let errorLabelConstraints = [
            self.errorLabel.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 3),
            self.errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        
        
        self.heightConstraint = heightAnchor.constraint(equalToConstant: 50)
        self.heightConstraint.isActive = true
        NSLayoutConstraint.activate(textFieldConstraints)
        NSLayoutConstraint.activate(errorLabelConstraints)
    }
}

