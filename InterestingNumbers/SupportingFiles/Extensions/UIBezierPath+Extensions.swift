//
//  UIBezierPath+Extensions.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 14/08/2022.
//

import UIKit

extension UIBezierPath {    
    func fill(color: UIColor) {
        color.setFill()
        fill()
    }

    func stroke(color: UIColor) {
        color.setStroke()
        stroke()
    }
}
