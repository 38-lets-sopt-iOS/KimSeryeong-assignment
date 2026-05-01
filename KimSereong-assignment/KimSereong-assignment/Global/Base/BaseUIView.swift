//
//  BaseUIView.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

class BaseUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setStyle() {}

    func setUI() {}

    func setLayout() {}
}
