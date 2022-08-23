//
//  DataRequest.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 17/08/2022.
//

import Foundation

protocol DataRequest {
    associatedtype Model
    associatedtype Entity

    var urlComponents: URLComponents { get }
    var url: URL? { get }

    func decode(_ data: Data) -> Result<Entity, Error>
}
