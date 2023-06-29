//
//  ViewController.swift
//  ToDoList
//
//  Created by ILKER on 29.06.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    private let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "checkmark.shield")
        return imageView
    }()
    private lazy var emailContainerView: UIView = {
       let containerView = UIView()
        containerView.backgroundColor = .red
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "envelope")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        containerView.addSubview(imageView)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            
            emailTextField.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            emailTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
        return containerView
    }()
    private let emailTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = .white
        return textField
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension LoginViewController {
    private func style() {
        backgroundGraidentColor()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 200 / 2
        emailContainerView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        view.addSubview(logoImageView)
        view.addSubview(emailContainerView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            emailContainerView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            emailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            emailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            emailContainerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
