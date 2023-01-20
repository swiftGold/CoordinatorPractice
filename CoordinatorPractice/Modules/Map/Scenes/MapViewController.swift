//
//  MapViewController.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 18.01.2023.
//

import UIKit

protocol MapViewProtocol: AnyObject {}

final class MapViewController: UIViewController, MapViewProtocol {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        button.layer.cornerRadius = 16
        return button
    }()
    
    var router: MapRouterInput?
    var presenter: MapPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            nextButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func didTapButton() {
        router?.finishFlow()
    }
}

protocol MapPresenterProtocol: AnyObject {}

final class MapPresenter: MapPresenterProtocol {
    weak var viewController: MapViewProtocol?
    
    private let networkService: Networkable
    
    init(networkService: Networkable) {
        self.networkService = networkService
    }
}

protocol MapRouterInput: AnyObject {
    func routerToSearchAdress()
    func routeToRestaurants()
    func finishFlow()
}

protocol SearchAdressRouterInput: AnyObject {
    
}

protocol RestaurantsRouteInput: AnyObject {
    
}

