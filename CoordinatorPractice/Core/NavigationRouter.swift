//
//  NavigationRouter.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 18.01.2023.
//

import UIKit

final class NavigationRouter {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension NavigationRouter: Router {
    func setRoot(_ viewController: UIViewController) {
        navigationController.viewControllers = [viewController]
    }
    
    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
}
