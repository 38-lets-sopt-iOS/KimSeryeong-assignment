//
//  String+.swift
//  KimSereong-assignment
//
//  Created by 김세령 on 4/30/26.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = try! Regex("^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$")
        return self.wholeMatch(of: regex) != nil
    }
    
    var isValidPassword: Bool {
            let regex = try! Regex("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{10,}$")
            return self.wholeMatch(of: regex) != nil
    }
}
