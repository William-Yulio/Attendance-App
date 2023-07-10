//
//  OnBoardingViewController.swift
//  Attendance App
//
//  Created by William Yulio on 12/06/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
//    let loginButton = UIButton()
//    let signupButton = UIButton()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.roundCorners(corners: [.topRight, .topLeft], amount: 25)
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    
    init(imageName: String, titleText: String, subtitleText: String) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textAlignment = .center
        
        subtitleLabel.numberOfLines = 0
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
//        loginButton.translatesAutoresizingMaskIntoConstraints = false
//        loginButton.setTitleColor(UIColor(rgb: 0x0063C6), for: .normal)
//        loginButton.setTitle("Login", for: .normal)
//
//        signupButton.translatesAutoresizingMaskIntoConstraints = false
//        signupButton.setTitleColor(UIColor(rgb: 0x77869E), for: .normal)
//        signupButton.setTitle("Sign Up", for: .normal)
        
    }
        
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        
        view.addSubview(stackView)
        view.backgroundColor = UIColor(rgb: 0xF8F9F9)
//        view.backgroundColor = .blue
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            
            containerView.heightAnchor.constraint(equalToConstant: 400),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 2),
            
//            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            loginButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            
        ])
    }
}
