//
//  DummyTabViewController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then

final class DummyTabViewController: UIViewController {
    
    // MARK: - Data
    
    private let imageView = UIImageView()
    private let imageName: String
    
    // MARK: - init
    
    init(imageName: String) {
        self.imageName = imageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setUI()
        setLayout()
    }
    
    // MARK: - Setup

    private func setUI() {
        view.addSubview(imageView)
        
        imageView.do {
            $0.image = UIImage(named: imageName)
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
    }
}
