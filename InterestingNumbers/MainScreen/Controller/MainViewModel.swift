//
//  MainViewModel.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import Foundation

protocol MainViewModelProtocol {
    init(network: NetworkManagerProtocol)
    
    func fetchData(number: Int)
}

final class MainViewModel: MainViewModelProtocol {

    enum State {
        case onReceiveNumberEntity(NumberEntity)
        case onErrorOccured(Error)
    }

    public var onStateChanges: ((State) -> Void)?
    private var currentNumberType: NumberType = .defaultType

    private let network: NetworkManagerProtocol
    
    required init(network: NetworkManagerProtocol) {
        self.network = network
    }

    func update(number: Int, type: NumberType) {
        currentNumberType = type
        fetchData(number: number)
    }

    func fetchData(number: Int) {
        network.performRequest(by: getURLComponents(by: number).url) { [weak self] result in
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

// MARK: - Private Methods
private extension MainViewModel {

    func getURLComponents(by number: Int) -> URLComponents {
        var numberURLComponents = Constants.Components.numbersURLComponents
        numberURLComponents.path = "/\(number)/\(currentNumberType.rawValue)"
        return numberURLComponents
    }
}
