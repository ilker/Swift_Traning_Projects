//
//  RegisterViewController.swift
//  ToDoApp
//
//  Created by ILKER on 17.11.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    private var viewModel = RegisterViewModel()
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
    private lazy var nameContainerView: UIView = {
       let containerView = AuthenticationInputView(image: UIImage(systemName: "person")!, textfield: nameTextField)
        
        return containerView
    }()
    private lazy var userNameContainerView: UIView = {
       let containerView = AuthenticationInputView(image: UIImage(systemName: "person.fill")!, textfield: userNameTextField)
        
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
    private let nameTextField: UITextField = {
       let textField = CustomTextField(placeHolder: "Name")
        return textField
    }()
    private let userNameTextField: UITextField = {
       let textField = CustomTextField(placeHolder: "User Name")
        return textField
    }()
    private lazy var registerButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 7
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
        return button
    }()
    private var stackView = UIStackView()
    
    private lazy var switchToLoginPage: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "If you are a member, Login Page", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGoLogin), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
// MARK: - Helpers
extension RegisterViewController {
    private func style() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        backgroundGradientColor()
        self.navigationController?.navigationBar.isHidden = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView = UIStackView(arrangedSubviews: [nameContainerView, userNameContainerView, emailContainerView, passwordContainerView, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        switchToLoginPage.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
    }
    private func layout() {
        view.addSubview(stackView)
        view.addSubview(switchToLoginPage)
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 300),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
            
            switchToLoginPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            switchToLoginPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            switchToLoginPage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
    }
    private func registerButtonStatus() {
        if viewModel.status {
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor.darkGray
        } else {
            registerButton.isEnabled = false
            registerButton.backgroundColor = UIColor.gray
        }
    }
}
// MARK: - Selector
extension RegisterViewController {
    @objc private func handleKeyboardWillShow() {
        self.view.frame.origin.y = -260
    }
    @objc private func handleKeyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    @objc private func handleRegisterButton(_ sender: UIButton) {
        guard let emailText = emailTextField.text else { return }
        guard let passwordText = passwordTextField.text else { return }
        guard let nameText = nameTextField.text else { return }
        guard let usernameText = userNameTextField.text else { return }
        showHud(show: true)
        let user = AuthenticationRegisterUserModel(emailText: emailText, passwordText: passwordText, usernameText: nameText, nameText: usernameText)
        AuthenticationService.createUser(user: user) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                self.showHud(show: false)
                return
            }
            self.showHud(show: false)
            self.dismiss(animated: true)
        }
    }
    @objc private func handleGoLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    @objc private func handleTextField(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.emailText = sender.text
        } else if sender == nameTextField {
            viewModel.nameText = sender.text
        } else if sender == userNameTextField {
            viewModel.userNameText = sender.text
        } else {
            viewModel.passwordText = sender.text
        }
        registerButtonStatus()
    }
}
