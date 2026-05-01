//
//  AuthTextField.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 5/1/26.
//

import UIKit

import Then
import SnapKit

enum TextFieldType {
    case email
    case password
    case nickname
}

enum TextFieldState {
    case normal
    case typing
}

final class AuthTextField: BaseUIView {
    
    // MARK: - Data
    
    var onTextChange: ((String) -> Void)?
    
    var type: TextFieldType = .email {
        didSet {
            setFieldStyle()
        }
    }
    
    var state: TextFieldState = .normal {
        didSet {
            updateUI()
        }
    }
    
    var isSuccess: Bool = false {
        didSet {
            updateStatusButton()
        }
    }
    
    private var isSecure: Bool = true
    
    
    // MARK: - UI
    
    let textField = UITextField()
    private let clearButton = UIButton(type: .custom)
    private let statusButton = UIButton(type: .custom)
    private let rightStackView = UIStackView()
    
    
    // MARK: - Setup
    
    override func setStyle() {
        backgroundColor = .gray600
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.clear.cgColor
        
        textField.do {
            $0.textColor = .white
            $0.font = .body2
        }
        
        clearButton.do {
            $0.setImage(UIImage(named: "Close-Square"), for: .normal)
            $0.isHidden = true
        }
        
        statusButton.do {
            $0.isHidden = true
        }
        
        rightStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
        
        setupAction()
        setFieldStyle()
    }
    
    override func setUI() {
        addSubview(textField)
        addSubview(rightStackView)
        
        rightStackView.addArrangedSubview(clearButton)
        rightStackView.addArrangedSubview(statusButton)
    }
    
    override func setLayout() {
        rightStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalTo(rightStackView.snp.leading).offset(-10)
            $0.centerY.equalToSuperview()
        }
    }
    
    
    // MARK: - Action
    
    private func setupAction() {
        textField.addTarget(self, action: #selector(textChange), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearTap), for: .touchUpInside)
        statusButton.addTarget(self, action: #selector(statusTap), for: .touchUpInside)
    }
    
    
    // MARK: - Field Style
    
    private func setFieldStyle() {
        switch type {
        case .email:
            textField.placeholder = "이메일 입력"
            textField.isSecureTextEntry = false
            statusButton.setImage(UIImage(named: "checkOff"), for: .normal)
            
        case .password:
            textField.placeholder = "비밀번호 입력"
            textField.isSecureTextEntry = isSecure
            statusButton.setImage(UIImage(named: "eye-off"), for: .normal)
            
        case .nickname:
            textField.placeholder = "닉네임 입력"
            textField.isSecureTextEntry = false
            statusButton.isHidden = true
        }
    }
    
    
    // MARK: - UI Update
    
    private func updateUI() {
        switch state {
        case .normal:
            layer.borderColor = UIColor.clear.cgColor
        case .typing:
            layer.borderColor = UIColor.gray.cgColor
        }
        
        let hasText = !(textField.text?.isEmpty ?? true)
        clearButton.isHidden = !hasText
        
        updateStatusButton()
    }
    
    private func updateStatusButton() {
        let hasText = !(textField.text?.isEmpty ?? true)
        statusButton.isHidden = !hasText
        
        switch type {
        case .email:
            let imageName = isSuccess ? "check-on" : "check-off"
            statusButton.setImage(UIImage(named: imageName), for: .normal)
            
        case .password:
            let imageName = isSecure ? "eye-off" : "eye-on"
            statusButton.setImage(UIImage(named: imageName), for: .normal)
            
        case .nickname:
            statusButton.isHidden = true
        }
    }
    
    
    // MARK: - objc
    
    @objc private func textChange() {
        let text = textField.text ?? ""
            state = text.isEmpty ? .normal : .typing
            
            if type == .email {
                isSuccess = text.isValidEmail
            }
            
            onTextChange?(text)
    }
    
    @objc private func clearTap() {
        textField.text = ""
        state = .normal
        onTextChange?("")
    }
    
    @objc private func statusTap() {
        if type == .password {
            isSecure.toggle()
            textField.isSecureTextEntry = isSecure
            updateStatusButton()
        }
    }
}
