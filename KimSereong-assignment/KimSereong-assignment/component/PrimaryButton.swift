//
//  PrimaryButton.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/22/26.
//

import UIKit

class PrimaryButton: UIButton {
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .watchapink
                setTitleColor(.white, for: .normal)
            } else {
                backgroundColor = .gray400
                setTitleColor(.gray200, for: .normal)
            }
        }
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    // MARK: - setUp

    
    private func setupStyle() {
        backgroundColor = .watchapink
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .medium
        layer.cornerRadius = 10
    }
    
}
