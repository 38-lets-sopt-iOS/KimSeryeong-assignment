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
    
    let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .boldSystemFont(ofSize: 20)
            $0.textColor = .white
        }
        
        subtitleLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .lightGray
        }
    }
    
    private func setUI() {
        backgroundColor = .clear
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Data Bind
    
    func bind(title: String?, subtitle: String?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        subtitleLabel.isHidden = subtitle?.isEmpty ?? true
    }
}
