//
//  MainViewController.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 03/07/2022.
//
//

import UIKit

class MainViewController<ContentView: MainContentViewProtocol>: UIViewController {

    let contentView: ContentView
    let viewModel: MainViewModelProtocol

    init(viewModel: MainViewModelProtocol) {
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
}
