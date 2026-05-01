//
//  Untitled.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/23/26.
//


import UIKit
import SnapKit

final class EmailTextFieldView: UIView {
    
    // MARK: - UI
    
    let textField = UITextField()
    private let clearButton = UIButton(type: .custom)
    private let checkImageView = UIImageView()
    
    // MARK: - State
    
    enum State {
        case normal
        case typing
    }
    
    var state: State = .normal {
        didSet { updateUI() }
    }
    
    // MARK: - Init
    
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
        
        // textField
        textField.textColor = .white
        textField.font = .body2
        
        textField.attributedPlaceholder = NSAttributedString(
            string: "email@example.com",
            attributes: [.foregroundColor: UIColor.gray]
        )
        
        // clearButton
        clearButton.setImage(UIImage(named: "Close-Square"), for: .normal)
        clearButton.tintColor = .gray
        clearButton.isHidden = true
        
        
        // checkImageView
        checkImageView.image = UIImage(named: "check-off")
        checkImageView.contentMode = .scaleAspectFit
        checkImageView.isHidden = true
    }
    
    private func setupLayout() {
        addSubview(textField)
        addSubview(clearButton)
        addSubview(checkImageView)
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(checkImageView.snp.leading).offset(-8)
        }
        
        checkImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        clearButton.snp.makeConstraints {
            $0.trailing.equalTo(checkImageView.snp.leading).offset(-4)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(20)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(47)
        }
    }
    
    private func setupAction() {
        textField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Logic
    
    @objc private func textChanged() {
        guard let text = textField.text else { return }
        state = text.isEmpty ? .normal : .typing
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
            clearButton.isHidden = true
            checkImageView.isHidden = true
            
        case .typing:
            clearButton.isHidden = false
            checkImageView.isHidden = false
        }
    }
    
    // MARK: - Public
    
    func setPlaceholder(_ text: String) {
        textField.placeholder = text
    }
}
