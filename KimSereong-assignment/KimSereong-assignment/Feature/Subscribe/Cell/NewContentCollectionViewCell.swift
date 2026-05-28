//
//  NewCollectionViewCell.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then

class NewContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - identifier
    
    static let identifier = "NewContentCollectionViewCell"
        
        private let contentImageView = UIImageView()
    
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
            contentView.addSubview(contentImageView)
            
            contentImageView.do {
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
                $0.layer.cornerRadius = 10
            }
        }
        
        private func setLayout() {
            contentImageView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    
    // MARK: - Databind
    
        func bindImage(_ imageName: String) {
            contentImageView.image = UIImage(named: "new1")
        }
}
