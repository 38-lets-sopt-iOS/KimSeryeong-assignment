//
//  SubscribeViewController+CollectionView.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 5/1/26.
//

import UIKit

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
