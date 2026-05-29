//
//  PasswordTextFieldView.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/23/26.
//

import UIKit
import SnapKit

final class PasswordTextFieldView : UIView {
    
    // MARK: - UI
    
    let textField = UITextField()
    private let clearButton = UIButton(type: .custom)
    private let eyeButton = UIButton(type: .custom)
    private var isSecure: Bool = true
    
    // MARK: - State
    
    enum State {
        case normal
        case focused
    }
    
    var state: State = .normal {
        didSet { updateUI() }
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
        setupAction()
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Setup
    
    private func setupUI() {
        backgroundColor = .gray600
        layer.cornerRadius = 10
        
        //textfield
        textField.textColor = .white
        textField.font = .body2
        textField.isSecureTextEntry = true
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호 입력",
            attributes: [.foregroundColor: UIColor.gray]
        )
        
        //clearbutton
        clearButton.setImage(UIImage(named: "Close-Square"), for: .normal)
        clearButton.tintColor = .gray
        
        //eyebutton
        eyeButton.setImage(UIImage(named: "eye-on"), for: .normal)
        eyeButton.tintColor = .gray
        
        }
    
    private func setupLayout() {
        addSubview(textField)
        addSubview(clearButton)
        addSubview(eyeButton)
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(eyeButton.snp.leading).offset(-8)
        }
        
        eyeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        clearButton.snp.makeConstraints {
            $0.trailing.equalTo(eyeButton.snp.leading).offset(-4)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(47)
        }
        
    }
    
    private func setupAction() {
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        eyeButton.addTarget(self, action: #selector(eyeImageViewTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Logic
    
    @objc private func textChanged() {
        guard let text = textField.text else { return }
        state = text.isEmpty ? .normal : .focused
    }
    
    @objc private func eyeImageViewTapped() {
        isSecure.toggle()
            
            textField.isSecureTextEntry = isSecure
            
            let imageName = isSecure ? "eye-on" : "eye-off"
            eyeButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    @objc private func clearButtonTapped() {
        textField.text = ""
        state = .normal
        
        textField.sendActions(for: .editingChanged)
    }
    
    // MARK: - UI Update
    
    private func updateUI() {
        switch state {
        case .normal:
            clearButton.isHidden = false
            eyeButton.isHidden = false
            
        case .focused:
            clearButton.isHidden = false
            eyeButton.isHidden = false
        }
    }
    
    // MARK: - Public
    
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }

    

    
    
    

    
}
