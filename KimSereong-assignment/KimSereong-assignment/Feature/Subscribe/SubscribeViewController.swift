//
//  SubscriptionViewController.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then

final class SubscribeViewController: UIViewController {
    
    // MARK: - UI
    
    private let titleLabel = UILabel()
    private let videoButton = UIButton(type: .system)
    private let tvButton = UIButton(type: .system)
    private let profileButton = UIButton(type: .system)
    
    private var homeCollectionView: UICollectionView = {
        let layout = CompositionalLayout.createLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Data
    
    private var sectionList: [SectionModel] = [
        SectionModel(
            type: .main,
            items: ["main1", "main2", "main1"],
            headerTitle: nil),
        SectionModel(
            type: .newcontent,
            items: ["new1", "new2", "new1"],
            headerTitle: "방금 막 도착한 신상 콘텐츠\n예능부터 드라마까지"),
        SectionModel(
            type: .watgorithm,
            items: ["sub1", "sub2", "sub3", "sub3"],
            headerTitle: "왓고리즘"),
        SectionModel(
            type: .comingcontent,
            items: ["sub1", "sub2", "sub1", "sub2"],
            headerTitle: "공개 예정 콘텐츠"),
        SectionModel(
            type: .watchaparty,
            items: ["party1", "party2", "party1"],
            headerTitle: "왓챠파티")
    ]
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setStyle()
        setUI()
        setLayout()
        setDelegate()
        register()
    }
    
    // MARK: - Setup
    
    private func setStyle() {
        titleLabel.do {
            $0.text = "구독"
            $0.textColor = .white
            $0.font = .head1
        }
        
        videoButton.do {
            $0.setImage(UIImage(named: "Video"), for: .normal)
            $0.tintColor = .white
        }
        
        tvButton.do {
            $0.setImage(UIImage(named: "Notification"), for: .normal)
            $0.tintColor = .white
        }
        
        profileButton.do {
            $0.setImage(UIImage(named: "Profile"), for: .normal)
            $0.tintColor = .white
        }
    }
    
    private func setUI() {
        [titleLabel, videoButton, tvButton, profileButton, homeCollectionView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        
        profileButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(24)
        }
        
        tvButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalTo(profileButton.snp.leading).offset(-16)
            $0.width.height.equalTo(24)
        }
        
        videoButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalTo(tvButton.snp.leading).offset(-16)
            $0.width.height.equalTo(24)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func register() {
        homeCollectionView.register(MaincontentCollectionViewCell.self, forCellWithReuseIdentifier: MaincontentCollectionViewCell.identifier)
        
        homeCollectionView.register(NewContentCollectionViewCell.self, forCellWithReuseIdentifier: NewContentCollectionViewCell.identifier)
        
        homeCollectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        
        homeCollectionView.register(
            SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.identifier
        )
    }
}

// MARK: - extension

extension SubscribeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionList[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sectionList[indexPath.section]
        
        switch section.type {
            
        case .main:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MaincontentCollectionViewCell.identifier,
                for: indexPath
            ) as? MaincontentCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bindImage(section.items[indexPath.item])
            return cell
            
        case .newcontent:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NewContentCollectionViewCell.identifier,
                for: indexPath
            ) as? NewContentCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bindImage(section.items[indexPath.item])
            return cell
            
        case .watgorithm, .comingcontent, .watchaparty:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PosterCollectionViewCell.identifier,
                for: indexPath
            ) as? PosterCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bindImage(section.items[indexPath.item])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionHeaderView.identifier,
            for: indexPath
        ) as? SectionHeaderView else {
            return UICollectionReusableView()
        }
        
        header.titleLabel.text = sectionList[indexPath.section].headerTitle
        return header
    }
}

// MARK: - Delegate

extension SubscribeViewController: UICollectionViewDelegate {
    
}

