//
//  String+Extensions.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 23/08/2022.
//

import Foundation

extension String {
    func isNumber() -> Bool { !isEmpty && (rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil) }
}
