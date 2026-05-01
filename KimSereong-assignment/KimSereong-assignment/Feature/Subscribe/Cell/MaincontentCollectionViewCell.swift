//
//  MaincontentsCollectionViewCell.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then

class MaincontentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - identifier
    
    static let identifier: String = "MaincontentsCollectionViewCell"

    private let bannerImageView = UIImageView()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup

    private func setUI() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 12
        }
    }
    
    private func setLayout() {
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Databind
    
    func bindImage(_ imageName: String) {
        bannerImageView.image = UIImage(named: "main1")
    }
    
}
