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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 비밀번호를\n입력해주세요"
        label.textColor = .white
        label.numberOfLines = 2
        label.font = .head2
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray000
        label.font = .body1
        return label
    }()
    
    private let passwordTextLabel: UILabel = {
        let label = UILabel()
        label.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        label.textColor = .gray100
        label.font = .body1
        return label
    }()
    
    private lazy var nicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 설정", for: .normal)
        button.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
        return button
    }()
    
    private let passwordTextField = AuthTextField()
    
    private lazy var mainButton: UIButton = {
        let button = PrimaryButton(title: "가입하기")
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
        return button
    }()
    

    
    
    // MARK: - Setup
    
    private func setUI() {
        [titleLabel, subTitleLabel, passwordTextField, nicknameButton, passwordTextLabel, mainButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(152)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(44)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(52)
        }
        
        passwordTextLabel.snp.makeConstraints {
            $0.top.equalTo(passwordTextLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().inset(54)
        }
        
        
        nicknameButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
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
            subTitleLabel.text = "\(email)로 가입중"
        } else {
            subTitleLabel.text = "email로 가입중"
        }
    }
    
    private func vaildate() {
        let password = passwordTextField.textField.text ?? ""
        mainButton.isEnabled = password.isValidPassword && nickname != nil
    }
    
    
    // MARK: - Actions
    
    private func setAction() {
        passwordTextField.textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
    }
    
    @objc private func textChanged() {
        vaildate()
    }
    
    @objc private func showBottomSheet() {
        let bottomSheetViewController = BottomSheetViewController()
        bottomSheetViewController.delegate = self
        bottomSheetViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = bottomSheetViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        
        present(bottomSheetViewController, animated: true)
    }
    
    @objc private func nextButtonDidTapped() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.nickname = nickname
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true)
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setUI()
        setLayout()
        setAction()
        updateUI()
        vaildate()
        
        passwordTextField.type = .password
    }
    
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


