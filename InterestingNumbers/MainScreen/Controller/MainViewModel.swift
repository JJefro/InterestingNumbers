//
//  MainViewModel.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import Foundation

protocol MainViewModelProtocol {
    init(network: NetworkManagerProtocol)
    
    func fetchDescription(for: Number)
}

final class MainViewModel: MainViewModelProtocol {

    enum State {
        case onReceiveNumberEntity(NumberEntity)
        case onErrorOccured(Error)
    }

    public var onStateChanges: ((State) -> Void)?
    private var currentNumberType: NumberType = .trivia

    private let network: NetworkManagerProtocol
    
    required init(network: NetworkManagerProtocol) {
        self.network = network
    }

    func update(number: Number, type: NumberType) {
        currentNumberType = type
        fetchDescription(for: number)
    }

    func fetchDescription(for number: Number) {
        guard number.rawValue.isNumber() else { return }
        let request = NumberRequest(number: number.rawValue, type: currentNumberType)
        network.perform(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(entity):
                print(entity)
                self.onStateChanges?(.onReceiveNumberEntity(entity))
            case let .failure(error):
                self.onStateChanges?(.onErrorOccured(error))
            }
        }
    }
}
