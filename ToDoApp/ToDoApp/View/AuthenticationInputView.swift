//
//  AuthenticationInputView.swift
//  ToDoApp
//
//  Created by ILKER on 17.11.2023.
//

import UIKit
class AuthenticationInputView: UIView {
    init(image: UIImage ,textfield: UITextField) {
        super.init(frame: .zero)
        backgroundColor = .clear
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textfield)
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 26),
            imageView.widthAnchor.constraint(equalToConstant: 26),
            
            textfield.centerYAnchor.constraint(equalTo: centerYAnchor),
            textfield.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            textfield.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            textfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.7)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
