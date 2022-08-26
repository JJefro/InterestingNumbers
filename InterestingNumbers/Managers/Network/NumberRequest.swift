//
//  NumberRequest.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 17/08/2022.
//

import Foundation

struct NumberRequest: DataRequest {
    
    typealias Model = NumberModel
    typealias Entity = NumberEntity

    private var number: String
    private var numberType: NumberType

    var url: URL?
    var urlComponents: URLComponents { Constants.Components.numbersURLComponents }

    init(number: String, type: NumberType) {
        self.number = number
        self.numberType = type
        self.url = getURL()
    }

    mutating func getURL() -> URL? {
        var components = urlComponents
        components.path = "/\(number)/\(numberType.rawValue)"
        return components.url
    }
}

extension DataRequest where Model == NumberModel, Entity == NumberEntity {
    func decode(_ data: Data) -> Result<Entity, Error> {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(Model.self, from: data)
            return .success(Entity(data: decoderData))
        } catch {
            return .failure(error)
        }
    }
}
