//
//  CompleteButton.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/22/26.
//

import UIKit

class CompleteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupStyle() {
        backgroundColor = .gray600
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .medium
        layer.cornerRadius = 10
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
}
