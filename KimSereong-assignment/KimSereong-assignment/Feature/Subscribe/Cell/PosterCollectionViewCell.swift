//
//  PosterCollectionView.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then

final class PosterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - identifier
    
    static let identifier = "PosterCollectionViewCell"
    
    private let posterImageView = UIImageView()
    
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
        contentView.addSubview(posterImageView)
        
        posterImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
        }
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Databind
    
    func bindImage(_ imageName: String) {
        posterImageView.image = UIImage(named: imageName)
    }
}
