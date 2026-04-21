//
//  UIColor+Extension.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/22/26.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)
        
        if hex.hasPrefix("#") {
            scanner.currentIndex = hex.index(after: hex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255
        let b = CGFloat(rgbValue & 0x0000FF) / 255
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

extension UIColor {
    static let gray100 = UIColor(hex: "84868D")
    static let gray200 = UIColor(hex: "92959A")
    static let gray300 = UIColor(hex: "57585C")
    static let gray400 = UIColor(hex: "505155")
    static let gray500 = UIColor(hex: "4A4C4D")
    static let gray600 = UIColor(hex: "191A1C")
    static let watchapink = UIColor(hex: "DE2A60")
    static let watchagreen = UIColor(hex: "0ACA9E")
}
