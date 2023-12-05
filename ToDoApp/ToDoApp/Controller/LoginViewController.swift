//
//  ViewController.swift
//  ToDoApp
//
//  Created by ILKER on 16.11.2023.
//

import UIKit

class LoginViewController: UIViewController {
    // MARK: - Properties
    private var viewModel = LoginViewModel()
    private let logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "checkmark.shield")
        imageView.tintColor = .white
        return imageView
    }()
    private lazy var emailContainerView: UIView = {
       let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textfield: emailTextField)
        
        return containerView
    }()
    private lazy var passwordContainerView: UIView = {
       let containerView = AuthenticationInputView(image: UIImage(systemName: "lock")!, textfield: passwordTextField)
        
        return containerView
    }()
    private let emailTextField: UITextField = {
       let textField = CustomTextField(placeHolder: "Email")
        return textField
    }()
    private let passwordTextField: UITextField = {
       let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    private lazy var loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 7
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        return button
    }()
    private var stackView = UIStackView()
    
    private lazy var switchToRegisterPage: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Click to Become A Member", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGoRegister), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        stlye()
        layout()

    }
}
// MARK: - Helpers
extension LoginViewController {
    private func stlye() {
        backgroundGradientColor()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.cornerRadius = 150 / 2
        stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        switchToRegisterPage.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
    }
    private func layout() {
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        view.addSubview(switchToRegisterPage)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
            
            switchToRegisterPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            switchToRegisterPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            switchToRegisterPage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    private func loginButtonStatus() {
        if viewModel.status {
            loginButton.isEnabled = true
            loginButton.backgroundColor = UIColor.darkGray
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor.gray
        }
        
    }
}
// MARK: - Selector
extension LoginViewController {
    @objc private func handleGoRegister(_ sender: UIButton) {
        let controller = RegisterViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func handleTextField(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.emailText = sender.text
        }else {
            viewModel.passwordText = sender.text
        }
        loginButtonStatus()
    }
    @objc private func handleLoginButton() {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        showHud(show: true)
        AuthenticationService.login(emailText: emailText, passwordText: passwordText) { result, error in
            if let error = error {
                print("error: \(error.localizedDescription)")
                self.showHud(show: false)
                return
            } else {
                self.showHud(show: false)
                self.dismiss(animated: true)
            }
        }
    }
}
