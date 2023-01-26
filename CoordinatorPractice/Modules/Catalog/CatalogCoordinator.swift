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
        //MARK: - Запуск контроллера через координатор без вайпера
//        let catalogViewController = diContainer.makeCatalogViewController(router: self )
//        router.push(catalogViewController, animated: true)
        
        //MARK: - Запуск контроллера через вайпер
        let viewController = diContainer.makeViewController(router: self)
        router.setRoot(viewController)
    }
}

extension CatalogCoordinator: CatalogRouterInput {
    func finishFlow() {
        onFinish?()
    }
}

extension CatalogCoordinator: RouterInput {}
