//
// Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import UIKit

class MainFlow {
    private var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func launch() {
        let mainViewController = configureMainViewController()
        let navigationController = configureNavigationController(rootViewController: mainViewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

// MARK: - ViewControllers Configurations
private extension MainFlow {
    func configureMainViewController() -> UIViewController {
        let viewModel = MainViewModel()
        return MainViewController<MainContentView>(viewModel: viewModel)
    }
}

// MARK: - NavigationController Configurations
private extension MainFlow {
    func configureNavigationController(rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        if #available(iOS 13, *) {
            let barAppearance = UINavigationBarAppearance()
            barAppearance.titleTextAttributes = [NSAttributedString.Key.font: R.font.openSansRegular(size: 15)!]
            navigationController.navigationBar.standardAppearance = barAppearance
            navigationController.navigationBar.scrollEdgeAppearance = barAppearance
        } else {
            let barAppearance = UINavigationBar.appearance()
            barAppearance.titleTextAttributes = [NSAttributedString.Key.font: R.font.openSansRegular(size: 15)!]
        }
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }
}
