//
//  Assembly.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 23.01.2023.
//
import UIKit

struct Dependencies {
    let networkService: Networkable
}

final class Assembly {
    private let router: RouterInput
    private let dependencies: Dependencies
    
    init(router: RouterInput,
         dependencies: Dependencies
    ) {
        self.router = router
        self.dependencies = dependencies
    }
    
    func build() -> UIViewController {
        let viewController = ViewController()
        let presenter = Presenter()
        let interacter = Interactor(networkService: dependencies.networkService)
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.interactor = interacter
        presenter.router = router
        interacter.output = presenter
        
        return viewController
    }
}
