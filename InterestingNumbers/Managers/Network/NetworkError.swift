//
//  NetworkError.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 08/08/2022.
//

import Foundation

enum NetworkError: Error {
    case unknownURL
    case unknownServerResponse
    case unknownStatusCode
    case noDataReceived
}

extension NetworkError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .unknownURL:
            return R.string.localizable.networkError_unknownURL()
        case .unknownServerResponse:
            return R.string.localizable.networkError_unknownServerResponse()
        case .unknownStatusCode:
            return R.string.localizable.networkError_unknownStatusCode()
        case .noDataReceived:
            return R.string.localizable.networkError_noDataReceived()
        }
    }
}
