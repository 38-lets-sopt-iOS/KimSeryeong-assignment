//
//  CompleteButton.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/22/26.
//

import UIKit

class CompleteButton: UIButton {
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    // MARK: - Logic

    private func setStyle() {
        backgroundColor = .gray600
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .medium
        layer.cornerRadius = 10
    }
    
}
