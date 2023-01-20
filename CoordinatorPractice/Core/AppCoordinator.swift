//
//  AppCoordinator.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 18.01.2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    private let diContainer: AppDIContainer
    private var router: Router?
    
    init(window: UIWindow,
         navigationController: UINavigationController = UINavigationController(),
         diContainer: AppDIContainer = AppDIContainer()
    ) {
        self.window = window
        self.window.rootViewController = navigationController
        self.router = NavigationRouter(navigationController: navigationController)
        self.diContainer = diContainer
    }
    
    override func start() {
        window.makeKeyAndVisible()
        startMapCoordinator()
    }
    
    private func startMapCoordinator() {
        guard let router else { return }
        let mapCoordinator = diContainer.makeMapCoordinator(router: router)
        addChild(mapCoordinator)
        mapCoordinator.start()
        mapCoordinator.onFinish = { [weak self] in
            self?.removeChild(mapCoordinator)
            self?.startCatalogCoordinator()
        }
    }
    
    private func startCatalogCoordinator() {
        guard let router else { return }
        let catalogCoordinator = diContainer.makeCatalogCoordinator(router: router)
        addChild(catalogCoordinator)
        catalogCoordinator.start()
        catalogCoordinator.onFinish = { [weak self] in
            self?.removeChild(catalogCoordinator)
            //TODO: - start next coordinator
            print("FINISH FLOW!!!!")
        }
    }
}
