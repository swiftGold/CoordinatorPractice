//
//  AppDIContainer.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 19.01.2023.
//

final class AppDIContainer {
    private let networkService: Networkable
    private let storageService: Storageble
    
    init(networkService: Networkable,
         storageService: Storageble
    ) {
        self.networkService = networkService
        self.storageService = storageService
    }
    
    convenience init() {
        let networkService = NetworkService()
        let storageService = StorageService()
        
        self.init(networkService: networkService,
                  storageService: storageService
        )
    }
}

extension AppDIContainer {
    func makeMapCoordinator(router: Router) -> CoordinatorOutput {
        let dependencies = MapModuleDependencies(mapNetworkService: networkService)
        let diContainer = MapDIContainer(dependencies: dependencies)
        let mapCoordinator = MapCoordinator(router: router, diContainer: diContainer)
        return mapCoordinator
    }
    
    func makeCatalogCoordinator(router: Router) -> CoordinatorOutput {
        let dependencies = CatalogModuleDependencies(catalogNetworkService: networkService)
        let diContainer = CatalogDIContainer(dependencies: dependencies)
        let catalogCoordinator = CatalogCoordinator(router: router, diContainer: diContainer)
        return catalogCoordinator
    }
}

protocol Networkable {}

final class NetworkService: Networkable {}

protocol Storageble {}

final class StorageService: Storageble {
    
}
