//
//  MainViewController.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 03/07/2022.
//
//

import UIKit

extension MainViewController where ViewModel == MainViewModel, ContentView == MainContentView {
    convenience init(network: NetworkManagerProtocol) {
        self.init(viewModel: MainViewModel(network: network))
    }
}

final class MainViewController<ContentView: MainContentViewProtocol, ViewModel: MainViewModelProtocol>: UIViewController {

    private let contentView: ContentView
    private let viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        self.contentView = ContentView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchDescription(for: Number(rawValue: "100"))
    }
}
