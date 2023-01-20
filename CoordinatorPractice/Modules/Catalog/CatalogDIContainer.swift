//
//  CatalogDIContainer.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 19.01.2023.
//

import UIKit

struct CatalogModuleDependencies {
    let catalogNetworkService: Networkable
}

final class CatalogDIContainer {
    private let dependencies: CatalogModuleDependencies
    
    init(dependencies: CatalogModuleDependencies) {
        self.dependencies = dependencies
    }
}

extension CatalogDIContainer {
    func makeCatalogViewController(router: CatalogRouterInput) -> UIViewController {
        let viewController = CatalogViewController()
        let presenter = CatalogPresenter(networkService: dependencies.catalogNetworkService)
        viewController.presenter = presenter
        presenter.viewController = viewController
        viewController.router = router
        return viewController
    }
    
    //    func makeSearchAdressViewController(router: SearchAdressRouterInput) -> UIViewController {}
    //
    //    func makeRestaurantsViewController(router: RestaurantsRouteInput) -> UIViewController {}
}

