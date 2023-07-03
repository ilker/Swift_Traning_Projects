//
//  AuthenticationInputView.swift
//  ToDoList
//
//  Created by ILKER on 29.06.2023.
//

import UIKit

class AuthenticationInputView: UIView {
    init(textField: UITextField, image: UIImage) {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        addSubview(imageView)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 26),
            imageView.widthAnchor.constraint(equalToConstant: 26),
            
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
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
