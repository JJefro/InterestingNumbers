//
//  MainViewController.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 03/07/2022.
//
//

import UIKit

final class MainViewController<ContentView: MainContentViewProtocol, ViewModel>: UIViewController where ViewModel: MainViewModelProtocol {

    private let contentView: ContentView
    private let viewModel: ViewModel

    init() {
        self.viewModel = ViewModel(network: NetworkManager())
        self.contentView = ContentView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
}
