//
//  UnderlineTextButtin.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/24/26.
//

import UIKit

class UnderlineTextButton: UIButton {
    
    // MARK: - init

    init(title: String) {
        super.init(frame: .zero)
        setTitleStyle(title: title)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup

    
    private func setTitleStyle(title: String) {
        let attributed = NSAttributedString(
            string: title,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.white,
                .font: UIFont.body1
            ]
        )
        
        setAttributedTitle(attributed, for: .normal)
    }
}
