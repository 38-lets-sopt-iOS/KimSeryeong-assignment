//
//  SubscribeModel.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/29/26.
//

import UIKit

import SnapKit
import Then


import UIKit

enum SectionType: Int, CaseIterable {
    case main = 0
    case newcontent = 1
    case watgorithm = 2
    case comingcontent = 3
    case watchaparty = 4 
    
    var numberOfItemInSection: Int {
        switch self {
        case .main, .newcontent :
            return 4
        default :
            return 4
        }
    }
}

struct SectionModel {
    let type: SectionType
    let items: [String]
    let headerTitle: String?
}
