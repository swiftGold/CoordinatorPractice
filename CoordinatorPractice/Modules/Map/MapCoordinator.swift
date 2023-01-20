//
//  MapCoordinator.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 18.01.2023.
//

import UIKit

final class MapCoordinator: BaseCoordinator & CoordinatorOutput {
    var onFinish: (() -> Void)?
    
    private let router: Router
    private let diContainer: MapDIContainer
    
    init(router: Router,
         diContainer: MapDIContainer
    ) {
        self.router = router
        self.diContainer = diContainer
    }
    
    override func start() {
        let mapViewController = diContainer.makeMapViewController(router: self)
        router.push(mapViewController, animated: true)
    }
}

extension MapCoordinator: MapRouterInput {
    func routerToSearchAdress() {
        let viewController = UIViewController()
        router.push(viewController, animated: true)
    }

    func routeToRestaurants() {
        let viewController = UIViewController()
        router.push(viewController, animated: true)
    }

    func finishFlow() {
        onFinish?()
    }
}

extension MapCoordinator: SearchAdressRouterInput {
    
}

extension MapCoordinator: RestaurantsRouteInput {
    
}
