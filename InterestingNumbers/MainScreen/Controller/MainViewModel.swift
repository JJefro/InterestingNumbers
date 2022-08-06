//
//  MainViewModel.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import Foundation

protocol MainViewModelProtocol {
    init(network: NetworkManagerProtocol)
}

class MainViewModel: MainViewModelProtocol {

    private let network: NetworkManagerProtocol
    
    required init(network: NetworkManagerProtocol) {
        self.network = network
    }
}
