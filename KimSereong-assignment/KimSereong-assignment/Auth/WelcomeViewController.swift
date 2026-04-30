//
//  WelcomeViewController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/21/26.
//

import UIKit
import SnapKit

class WelcomeViewController : UIViewController, NicknameDelegateProtocol {
    
    // MARK: - Data
    
    var nickname: String? = nil
    
    // MARK: - UI

    let watchaLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "WATCHA logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let welcomeText: UILabel = {
        let label = UILabel()
        label.text = "???님\n 가입을 환영합니다!"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .head2

        return label
    }()
    
    let mainbutton: UIButton = PrimaryButton(title: "메인으로")
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        bindID()
        
    }
    
    // MARK: - Setup
    
    private func setUI() {
        [watchaLogo, welcomeText, mainbutton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        watchaLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(85)
        }
        
        welcomeText.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(watchaLogo.snp.bottom).offset(54)
        }
        
        mainbutton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.height.equalTo(56)
            $0.bottom.equalToSuperview().inset(47)
        }
    }
    
    // MARK: - Logic
    
    private func bindID() {
        if let nickname = nickname {
                    welcomeText.text = "\(nickname)님 가입을 환영합니다!"
                } else {
                    welcomeText.text = "???님 가입을 환영합니다!"
                }
    }
    
    func didTapNickname(nickname: String) {
        self.nickname = nickname
        bindID() // UI 업데이트
    }

}
