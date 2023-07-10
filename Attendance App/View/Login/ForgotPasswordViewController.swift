//
//  ForgotPasswordViewController.swift
//  Attendance App
//
//  Created by William Yulio on 03/07/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    let stackView = UIStackView()
    let secStackView = UIStackView()
    let thirdStackView = UIStackView()
    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let confirmPassTextField = UITextField()
    let registButton = UIButton()
    let header = UILabel()
    let subHeader = UILabel()
    let titleUsername = UILabel()
    let titlePassword = UILabel()
    let titleConPassword = UILabel()
    let goToLoginBtn = UIButton()
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

extension ForgotPasswordViewController {
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
        header.text = "Forgot Password"
        header.font = .systemFont(ofSize: 24, weight: .bold)
        header.textColor = .white
        
        subHeader.translatesAutoresizingMaskIntoConstraints = false
        subHeader.text = "Please fill Usernaame, Password & New Password to reset your account"
        subHeader.font = .systemFont(ofSize: 16, weight: .medium)
        subHeader.numberOfLines = 0
        subHeader.textColor = .white
        
        titleUsername.translatesAutoresizingMaskIntoConstraints = false
        titleUsername.text = "No. KTP"
        titleUsername.font = .systemFont(ofSize: 16, weight: .medium)
        titleUsername.textColor = .systemGray
        
        titlePassword.translatesAutoresizingMaskIntoConstraints = false
        titlePassword.text = "Password"
        titlePassword.font = .systemFont(ofSize: 16, weight: .medium)
        titlePassword.textColor = .systemGray
        
        titleConPassword.translatesAutoresizingMaskIntoConstraints = false
        titleConPassword.text = "Repeat Password"
        titleConPassword.font = .systemFont(ofSize: 16, weight: .medium)
        titleConPassword.textColor = .systemGray
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.text = "Already Have Account? please"
        footer.font = .systemFont(ofSize: 12.0, weight: .medium)
        footer.textColor = UIColor(rgb: 0x8F8F8F)
        
        goToLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        goToLoginBtn.setTitleColor(UIColor(rgb: 0x0062CD), for: .normal)
        goToLoginBtn.setTitle("Login", for: .normal)
        goToLoginBtn.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .semibold)
        goToLoginBtn.addTarget(self, action: #selector(goToLoginPage(_:)), for: .primaryActionTriggered)
        
        registButton.translatesAutoresizingMaskIntoConstraints = false
        registButton.setTitle("Reset Password", for: .normal)
        registButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        registButton.backgroundColor = UIColor(rgb: 0xFFC33A)
        registButton.setTitleColor(UIColor(rgb: 0x414B5A), for: .normal)
        registButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        registButton.layer.cornerRadius = 8
        
        styleTextField(userNameTextField, withText: "3200009991121212", isSecure: false)
        styleTextField(passwordTextField, withText: "*****************", isSecure: true)
        styleTextField(confirmPassTextField, withText: "*****************", isSecure: true)
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
        view.addSubview(registButton)
        
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(titleUsername)
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(titlePassword)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(titleConPassword)
        stackView.addArrangedSubview(confirmPassTextField)

        containerView.addSubview(secStackView)
        secStackView.addArrangedSubview(footer)
        secStackView.addArrangedSubview(goToLoginBtn)
        
        view.backgroundColor = UIColor(rgb: 0x0062CD)

        NSLayoutConstraint.activate([

            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -130),
            
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
            userNameTextField.heightAnchor.constraint(equalToConstant: 57),
            userNameTextField.bottomAnchor.constraint(equalTo: titlePassword.topAnchor),

            titlePassword.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor),
            
            passwordTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: titleConPassword.topAnchor),
            
            titleConPassword.bottomAnchor.constraint(equalTo: confirmPassTextField.topAnchor),
            
            confirmPassTextField.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            confirmPassTextField.heightAnchor.constraint(equalTo: userNameTextField.heightAnchor),

            secStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            secStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50),
            secStackView.heightAnchor.constraint(equalToConstant: 30),
            secStackView.widthAnchor.constraint(equalToConstant: 220),
            
            goToLoginBtn.widthAnchor.constraint(equalToConstant: 40),
            
            registButton.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor),
            registButton.heightAnchor.constraint(equalToConstant: 57),
            registButton.bottomAnchor.constraint(equalTo: secStackView.topAnchor, constant: -20),
            registButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
    }
    
    @objc func goToLoginPage(_ sender: UIButton){
        let nextPage = LoginViewController()
        let navVC = UINavigationController(rootViewController: nextPage)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
