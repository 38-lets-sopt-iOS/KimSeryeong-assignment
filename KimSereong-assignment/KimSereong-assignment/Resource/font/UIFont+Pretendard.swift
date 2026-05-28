//
//  UIFont+Pretendard.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/21/26.
//

import UIKit

enum PretendardWeight: String {
    case thin = "Pretendard-Thin"
    case extraLight = "Pretendard-ExtraLight"
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case semiBold = "Pretendard-SemiBold"
    case bold = "Pretendard-Bold"
    case extraBold = "Pretendard-ExtraBold"
    case black = "Pretendard-Black"
}

extension UIFont {
    
    static func pretendard(_ weight: PretendardWeight, size: CGFloat) -> UIFont {
        return UIFont(name: weight.rawValue, size: size)
        ?? UIFont.systemFont(ofSize: size)
    }
    
    static let head1 = UIFont.pretendard(.semiBold, size: 30)
    static let head2 = UIFont.pretendard(.semiBold, size: 23)
    static let head3 = UIFont.pretendard(.semiBold, size: 20)
    static let subhead1 = UIFont.pretendard(.semiBold, size: 18)
    static let subhead2 = UIFont.pretendard(.semiBold, size: 15)
    static let subhead3 = UIFont.pretendard(.semiBold, size: 12)
    static let medium = UIFont.pretendard(.medium, size: 18)
    static let body1 = UIFont.pretendard(.medium, size: 12)
    static let body2 = UIFont.pretendard(.regular, size: 12)
    static let cap1 = UIFont.pretendard(.thin, size: 12)
}

