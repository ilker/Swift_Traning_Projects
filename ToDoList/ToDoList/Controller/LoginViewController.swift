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
        let containerView = AuthenticationInputView(textField: emailTextField, image: UIImage(systemName: "envelope")!)
        
        return containerView
    }()
    private lazy var passwordContainerView: UIView = {
        let containerView = AuthenticationInputView(textField: passwordTextField, image: UIImage(systemName: "lock")!)
        
        return containerView
    }()
    private let emailTextField: UITextField = {
       let textField = CustomTextField(placeHolder: "Email")
        return textField
    }()
    private let passwordTextField: UITextField = {
       let textField = CustomTextField(placeHolder: "Password")
        return textField
    }()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.33, green: 0.42, blue: 0.18, alpha: 1.00)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 7
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    private var stackview = UIStackView()
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
        stackview = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stackview.axis = .vertical
        stackview.spacing = 14
        stackview.distribution = .fillEqually
        stackview.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        view.addSubview(logoImageView)
        view.addSubview(stackview)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            stackview.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
}
