//
//  NumberEntity.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 08/08/2022.
//

import Foundation

protocol EntityProtocol {}

struct NumberEntity: EntityProtocol {
    let description: String
    let number: Number

    init(data: NumberModel) {
        self.description = data.found ? data.response : "No such number was found"
        self.number = Number(rawValue: String(describing: data.number))
    }
}
