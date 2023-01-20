//
//  CatalogCoordinator.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 19.01.2023.
//


final class CatalogCoordinator: BaseCoordinator & CoordinatorOutput {
    var onFinish: (() -> Void)?
    
    private let router: Router
    private let diContainer: CatalogDIContainer
    
    init(router: Router,
         diContainer: CatalogDIContainer
    ) {
        self.router = router
        self.diContainer = diContainer
    }
    
    override func start() {
        let catalogViewController = diContainer.makeCatalogViewController(router: self )
        router.push(catalogViewController, animated: true)
    }
}

extension CatalogCoordinator: CatalogRouterInput {
    func finishFlow() {
        onFinish?()
    }
}
