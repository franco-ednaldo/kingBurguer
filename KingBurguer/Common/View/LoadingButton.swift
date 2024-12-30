//
//  LoadingButton.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 30/12/24.
//

import Foundation
import UIKit

class LoadingButton: UIView {
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    lazy var progress: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    var title: String? {
        willSet {
            self.button.setTitle(newValue?.uppercased(), for: .normal)
        }
    }
    
    var titleColor: UIColor? {
        willSet {
            self.button.setTitleColor(newValue, for: .normal)
        }
    }
    
    override var backgroundColor: UIColor? {
        willSet {
            self.button.backgroundColor = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addTarget(_ target: Any?, action: Selector) {
        self.button.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func startLoading(loading: Bool) {
        self.button.isEnabled = !loading
        if loading {
            self.button.setTitle("", for: .normal)
            self.progress.startAnimating()
        } else {
            self.button.setTitle(self.title, for: .normal)
            self.progress.stopAnimating()
        }
    }
    
    private func setupView() {
        self.layer.cornerRadius = 8
        addSubview(button)
        addSubview(progress)
        
        let buttonConstraints = [
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        let progressConstraints = [
            progress.leadingAnchor.constraint(equalTo: leadingAnchor),
            progress.trailingAnchor.constraint(equalTo: trailingAnchor),
            progress.topAnchor.constraint(equalTo: topAnchor),
            progress.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(progressConstraints)
    }
    
}
