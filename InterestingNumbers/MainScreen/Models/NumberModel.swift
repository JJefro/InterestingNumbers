//
//  NumberModel.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 08/08/2022.
//

import Foundation

protocol ModelProtocol: Codable {}

struct NumberModel: ModelProtocol {
    let response: String
    let number: Int
    let found: Bool
    let type: String

    enum CodingKeys: String, CodingKey {
        case response = "text"
        case number, found, type
    }
}
