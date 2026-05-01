//
//  SectionHeaderView.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then

final class SectionHeaderView: UICollectionReusableView {
    
    static let identifier = "SectionHeaderView"
    
    // MARK: - UI
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .white
    }
    
    private let subtitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }
    
    private let watImage = UIImageView().then {
        $0.image = UIImage(named: "watgorithm")
        $0.isHidden = true
        $0.contentMode = .scaleAspectFit
    }
    
    private let moreButton = UIButton().then {
        $0.setTitle("더보기", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 11)
        $0.isHidden = true
    }
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setUI() {
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(watImage)
        addSubview(moreButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        watImage.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(22)
        }
        
        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalTo(titleLabel)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
