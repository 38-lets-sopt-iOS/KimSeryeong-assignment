//
//  LoginViewController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/21/26.
//

import UIKit
import SnapKit

class LoginViewController : UIViewController {

    // MARK: - UI

    let explainText1: UILabel = {
        let label = UILabel()
        label.text = "로그인/가입하려는\n이메일을 입력해주세요"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .head2

        return label
    }()
    
    
    let explainText2: UILabel = {
        let label = UILabel()
        label.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력해주세요." //줄간격 5 추가 코딩 필요
        label.numberOfLines = 2
        label.textColor = .gray000
        label.textAlignment = .left
        label.font = .body1
        
        return label
    }()
    
    
    let emailField: EmailTextFieldView = {
        let emailField = EmailTextFieldView()
        emailField.setPlaceholder("email@address.com")
        return emailField
    }()
    
    
    lazy var mainButton: UIButton = {
        let button = PrimaryButton(title: "다음")
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
        return button
    }()

    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAction()
        
    }
    
    
    // MARK: - Setup

    private func setUI() {
        [explainText1, explainText2, mainButton, emailField].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        explainText1.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalToSuperview().offset(152)
        }
        
        explainText2.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.top.equalTo(explainText1.snp.bottom).offset(13)
        }
        
        emailField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.top.equalTo(explainText2.snp.bottom).offset(26)
        }
        
        mainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview().inset(47)
        }
    }
    
    private func setAction() {
        emailField.textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    
    // MARK: - Logic
    
    @objc private func textChanged() {
        let email = emailField.textField.text ?? ""
        
        mainButton.isEnabled = !email.isEmpty && email.isValidEmail
        
    }
    
    //PasswordVC와 연결
    private func presentToPasswordVC() {
        let passwordViewController = PasswordViewController()
        passwordViewController.modalPresentationStyle = .fullScreen
        passwordViewController.email = emailField.textField.text
        self.present(passwordViewController, animated: true)
    }
    
    @objc private func nextButtonDidTapped() {
        presentToPasswordVC()
    }
}

    // MARK: - EmailExtension


    extension String {
        var isValidEmail: Bool {
            let regex = try! Regex("^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$")
            return self.wholeMatch(of: regex) != nil
        }
    }
