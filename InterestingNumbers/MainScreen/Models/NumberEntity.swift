//
//  NumberEntity.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 08/08/2022.
//

import Foundation

protocol EntityProtocol: Equatable {
    init(data: NumberModel)
}

struct NumberEntity: EntityProtocol {
    let description: String
    let number: String

    init(data: NumberModel) {
        self.description = data.response
        self.number = String(describing: data.number)
    }
}
