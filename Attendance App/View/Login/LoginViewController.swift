//
//  LoginViewController.swift
//  Attendance App
//
//  Created by William Yulio on 12/06/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    let stackView = UIStackView()
    let secStackView = UIStackView()
    let thirdStackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = makeButton(withText: "Login Now")
    let header = UILabel()
    let subHeader = UILabel()
    let titleUsername = UILabel()
    let titlePassword = UILabel()
    let goToForgetPassBtn = UIButton()
    let goToSignUpBtn = UIButton()
    let footer = UILabel()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.roundCorners(corners: [.topRight, .topLeft], amount: 15)
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        secStackView.translatesAutoresizingMaskIntoConstraints = false
        secStackView.axis = .horizontal
        secStackView.alignment = .fill
        
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.axis = .vertical
        thirdStackView.spacing = 20
        thirdStackView.alignment = .fill
        thirdStackView.distribution = .fillEqually
        
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "Welcome to Login"
        header.font = .systemFont(ofSize: 24, weight: .bold)
        header.textColor = .white
        
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        subHeader.text = "Please fill Username & password to login your app account"
        subHeader.font = .systemFont(ofSize: 16, weight: .medium)
        subHeader.numberOfLines = 0
        subHeader.textColor = .white
        
        titleUsername.translatesAutoresizingMaskIntoConstraints = false
        titleUsername.text = "Username"
        titleUsername.font = .systemFont(ofSize: 16, weight: .medium)
        titleUsername.textColor = .systemGray
        
        titlePassword.translatesAutoresizingMaskIntoConstraints = false
        titlePassword.text = "Password"
        titlePassword.font = .systemFont(ofSize: 16, weight: .medium)
        titlePassword.textColor = .systemGray
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        goToForgetPassBtn.translatesAutoresizingMaskIntoConstraints = false
        goToForgetPassBtn.setTitleColor(UIColor(rgb: 0x0062CD), for: .normal)
        goToForgetPassBtn.setTitle("Forgot Password ?", for: .normal)
        goToForgetPassBtn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        goToForgetPassBtn.addTarget(self, action: #selector(goToForgotPassPage(_:)), for: .primaryActionTriggered)
        
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.text = "Don't Have Account? please"
        footer.font = .systemFont(ofSize: 12.0, weight: .medium)
        footer.textColor = UIColor(rgb: 0x8F8F8F)
        
        goToSignUpBtn.translatesAutoresizingMaskIntoConstraints = false
        goToSignUpBtn.setTitleColor(UIColor(rgb: 0x0062CD), for: .normal)
        goToSignUpBtn.setTitle("Register", for: .normal)
        goToSignUpBtn.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .semibold)
        goToSignUpBtn.addTarget(self, action: #selector(goToSignUpPage(_:)), for: .primaryActionTriggered)
        
        styleTextField(userNameTextField, withText: "Username", isSecure: false)
        styleTextField(passwordTextField, withText: "*****************", isSecure: true)
    }
    
    private func styleTextField(_ textField: UITextField, withText text: String, isSecure: Bool) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = isSecure
    }
    
    func layout() {

        view.addSubview(thirdStackView)
        thirdStackView.addArrangedSubview(header)
        thirdStackView.addArrangedSubview(subHeader)
        view.addSubview(containerView)
        view.addSubview(goToForgetPassBtn)
        view.addSubview(loginButton)
        
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(titleUsername)
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(titlePassword)
        stackView.addArrangedSubview(passwordTextField)

        containerView.addSubview(secStackView)
        secStackView.addArrangedSubview(footer)
        secStackView.addArrangedSubview(goToSignUpBtn)
        
        view.backgroundColor = UIColor(rgb: 0x0062CD)
        
        NSLayoutConstraint.activate([

            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -180),
            
            thirdStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -280),

            header.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),

            subHeader.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            subHeader.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subHeader.trailingAnchor, multiplier: 4),
            
            containerView.heightAnchor.constraint(equalToConstant: 630),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            titleUsername.bottomAnchor.constraint(equalTo: userNameTextField.topAnchor),
            
            userNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            userNameTextField.heightAnchor.constraint(equalToConstant: 60),

            titlePassword.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor),
            
            passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),
            
            goToForgetPassBtn.widthAnchor.constraint(equalToConstant: 155),
            goToForgetPassBtn.heightAnchor.constraint(equalToConstant: 20),
            goToForgetPassBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            goToForgetPassBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            
            secStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            secStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50),
            secStackView.heightAnchor.constraint(equalToConstant: 30),
            secStackView.widthAnchor.constraint(equalToConstant: 220),
            
            goToSignUpBtn.widthAnchor.constraint(equalToConstant: 55),
            
            loginButton.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),
            loginButton.bottomAnchor.constraint(equalTo: secStackView.topAnchor, constant: -20),
            loginButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    @objc func goToForgotPassPage(_ sender: UIButton){
        let nextPage = ForgotPasswordViewController()
        let navVC1 = UINavigationController(rootViewController: nextPage)
        navVC1.modalPresentationStyle = .fullScreen
        present(navVC1, animated: true)
    }
    
    @objc func goToSignUpPage(_ sender: UIButton){
        let nextPage = SignUpViewController()
        let navVC2 = UINavigationController(rootViewController: nextPage)
        navVC2.modalPresentationStyle = .fullScreen
        present(navVC2, animated: true)
    }
}

func makeButton(withText text: String) -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(text, for: .normal)
    button.titleLabel?.adjustsFontSizeToFitWidth = true
    button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    button.backgroundColor = UIColor(rgb: 0xFFC33A)
    button.setTitleColor(UIColor(rgb: 0x414B5A), for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    button.layer.cornerRadius = 8
    return button
}
