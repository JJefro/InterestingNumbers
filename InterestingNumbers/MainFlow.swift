//
// Created by Jevgenijs Jefrosinins on 05/07/2022.
//

import UIKit

class MainFlow {
    private(set) lazy var presentationController = configureNavigationController()
    
    init(window: UIWindow?) {
        window?.rootViewController = presentationController
        window?.makeKeyAndVisible()
    }
    
    func launch() {
        presentationController.setViewControllers([
            MainViewController(network: NetworkManager())
        ], animated: true)
    }
}

// MARK: - NavigationController Configurations
private extension MainFlow {
    func configureNavigationController() -> UINavigationController {
        let navigationController = UINavigationController()
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
