//
//  PasswordViewController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/21/26.
//


import UIKit
import SnapKit

final class PasswordViewController: UIViewController {
    
    // MARK: - Data
    
    var email: String?
    var nickname: String?
    
    // MARK: - UI
    
    private let explainText1: UILabel = {
        let label = UILabel()
        label.text = "사용할 비밀번호를\n입력해주세요"
        label.textColor = .white
        label.numberOfLines = 2
        label.font = .head2
        return label
    }()
    
    private let explainText2: UILabel = {
        let label = UILabel()
        label.textColor = .gray000
        label.font = .body1
        return label
    }()
    
    private let explainText3: UILabel = {
        let label = UILabel()
        label.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        label.textColor = .gray100
        label.font = .body1
        return label
    }()
    
    private let enableButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "enable-off"), for: .normal)
        return button
    }()
    
    private lazy var nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 설정", for: .normal)
        button.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
        return button
    }()
    
    private let passwordField: PasswordTextFieldView = {
        let view = PasswordTextFieldView()
        view.setPlaceholder("비밀번호 입력")
        return view
    }()
    
    private lazy var mainButton: UIButton = {
        let button = PrimaryButton(title: "가입하기")
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUI()
        setLayout()
        setAction()
        updateUI()
        validate()
    }
    
    // MARK: - Setup
    
    private func setUI() {
        [explainText1, explainText2, explainText3, enableButton, nicknameButton, passwordField, mainButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        explainText1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(152)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        explainText2.snp.makeConstraints {
            $0.top.equalTo(explainText1.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        passwordField.snp.makeConstraints {
            $0.top.equalTo(explainText2.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        explainText3.snp.makeConstraints {
            $0.top.equalTo(passwordField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(54)
        }
        
        enableButton.snp.makeConstraints {
            $0.trailing.equalTo(explainText3.snp.leading).offset(-6)
            $0.centerY.equalTo(explainText3)
        }
        
        nicknameButton.snp.makeConstraints {
            $0.top.equalTo(explainText3.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    
    // MARK: - Logic
    
    private func updateUI() {
        if let email = email {
            explainText2.text = "\(email)로 가입중"
        } else {
            explainText2.text = "email로 가입중"
        }
    }
    
    private func validate() {
        let password = passwordField.textField.text ?? ""
        mainButton.isEnabled = password.isValidPassword && nickname != nil
    }
    
    
    // MARK: - Actions
    
    private func setAction() {
        passwordField.textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    @objc private func textChanged() {
        validate()
    }
    
    @objc private func showBottomSheet() {
        let bottomVC = BottomSheetViewController()
        bottomVC.delegate = self
        bottomVC.modalPresentationStyle = .pageSheet
        
        if let sheet = bottomVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        present(bottomVC, animated: true)
    }
    
    @objc private func nextButtonDidTapped() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.nickname = nickname
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true)
    }
    
    // MARK: - Navigation
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

    // MARK: - Delegate

    extension PasswordViewController: NicknameDelegateProtocol {
        func didTapNickname(nickname: String) {
            self.nickname = nickname
            nicknameButton.setTitle(nickname, for: .normal)
            
        }
    }

    // MARK: - PasswordExtension

    extension String {
        var isValidPassword: Bool {
                let regex = try! Regex("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{10,}$")
                return self.wholeMatch(of: regex) != nil
        }
    }

