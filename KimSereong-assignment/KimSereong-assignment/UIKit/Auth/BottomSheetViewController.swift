//
//  sheetPresentationController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/23/26.
//

import UIKit
import SnapKit

    // MARK: - Protocol


protocol NicknameDelegateProtocol: AnyObject {
    func didTapNickname(nickname: String)
}

final class BottomSheetViewController : UIViewController {
    
    
    // MARK: - Data
    
    weak var delegate: NicknameDelegateProtocol?
    private var nickname: String?
    
    // MARK: - UI
    
    let textlabel : UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요."
        label.font = .subhead1
        label.textColor = .white
        return label
    }()
    
    let textField : UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = .body2
        textField.backgroundColor = .gray600
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.attributedPlaceholder = NSAttributedString(
            string: "닉네임 입력",
            attributes: [.foregroundColor: UIColor.white]
        )
        return textField
    }()
    
    lazy var mainButton : UIButton = {
        let button = CompleteButton(title: "완료")
        button.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
        return button
    }()

    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray400
        
        setUI()
        setLayout()
        
    }
    
    // MARK: - Setup
    
    private func setUI() {
        [textlabel, textField, mainButton].forEach {
            view.addSubview($0)
        }
        
    }
    
    private func setLayout() {
        textlabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(42)
            $0.leading.equalToSuperview().inset(24)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(textlabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(47)
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
        }
    }
    
    // MARK: - Logic
    
    @objc private func completeButtonDidTap() {
        let nickname = textField.text ?? ""
        
        guard !nickname.isEmpty else { return }
        
        delegate?.didTapNickname(nickname: nickname)
        dismiss(animated: true)
    }
}
