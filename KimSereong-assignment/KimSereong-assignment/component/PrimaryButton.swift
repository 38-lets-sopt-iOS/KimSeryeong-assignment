//
//  PrimaryButton.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/22/26.
//

import UIKit

class PrimaryButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .watchapink
            } else {
                backgroundColor = .gray400
                setTitleColor(.gray200, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupStyle() {
        backgroundColor = .watchapink
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .medium
        layer.cornerRadius = 10
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
}
