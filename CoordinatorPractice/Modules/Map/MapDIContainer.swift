//
//  MapDIContainer.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 19.01.2023.
//
import UIKit

struct MapModuleDependencies {
    let mapNetworkService: Networkable
}

final class MapDIContainer {
    private let dependencies: MapModuleDependencies
    
    init(dependencies: MapModuleDependencies) {
        self.dependencies = dependencies
    }
}

extension MapDIContainer {
    func makeMapViewController(router: MapRouterInput) -> UIViewController {
        let viewController = MapViewController()
        let presenter = MapPresenter(networkService: dependencies.mapNetworkService)
        viewController.presenter = presenter
        presenter.viewController = viewController
        viewController.router = router
        return viewController
    }
    
    //    func makeSearchAdressViewController(router: SearchAdressRouterInput) -> UIViewController {}
    //
    //    func makeRestaurantsViewController(router: RestaurantsRouteInput) -> UIViewController {}
}
