//
//  LoginViewController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/21/26.
//

import UIKit

import SnapKit
import Then

class LoginViewController : UIViewController {

    // MARK: - UI
    
    private let emailTextField = AuthTextField()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인/가입하려는\n이메일을 입력해주세요"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .head2

        return label
    }()
    
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요."
        label.numberOfLines = 2
        label.textColor = .gray000
        label.textAlignment = .left
        label.font = .body1
        
        return label
    }()
    
    
    lazy var mainButton: UIButton = {
        let button = PrimaryButton(title: "다음")
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        return button
    }()

    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.type = .email
        
        setUI()
        setLayout()
        setAction()
        
    }
    
    
    // MARK: - Setup

    private func setUI() {
        [titleLabel, descriptionLabel, mainButton, emailTextField].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(152)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(26)
            $0.height.equalTo(52)
        }
        
        mainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview().inset(47)
        }
    }
    
    private func setAction() {
        emailTextField.textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    
    // MARK: - Logic
    
    @objc private func textChanged() {
        let email = emailTextField.textField.text ?? ""
        
        mainButton.isEnabled = !email.isEmpty && email.isValidEmail
        
    }
    
    
    private func presentToPasswordVC() {
        let passwordViewController = PasswordViewController()
        passwordViewController.modalPresentationStyle = .fullScreen
        passwordViewController.email = emailTextField.textField.text
        self.present(passwordViewController, animated: true)
    }
    
    @objc private func nextButtonDidTap() {
        presentToPasswordVC()
    }
}

