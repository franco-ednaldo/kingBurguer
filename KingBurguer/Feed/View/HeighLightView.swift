//
//  HeighLightView.swift
//  KingBurguer
//
//  Created by Ednaldo Franco on 01/01/25.
//

import UIKit

class HeighLightView: UIView {

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "highlight")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let moreButton:UIButton = {
        let button = UIButton()
        button.setTitle("Resgatar Cupom", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return button;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addGradient()
        addSubview(moreButton)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    
    private func addConstraints() {
        let moreButtonConstraints = [
            self.moreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -8),
            self.moreButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50)
        ]
        
        NSLayoutConstraint.activate(moreButtonConstraints)
    }
    
    
    func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    

}
