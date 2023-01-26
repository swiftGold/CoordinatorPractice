//
//  CatalogViewController.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 19.01.2023.
//

import UIKit

protocol CatalogViewProtocol: AnyObject {}

final class CatalogViewController: UIViewController, CatalogViewProtocol {
    
    private lazy var finishFlow: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("finish flow", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 16
        return button
    }()
    
    var router: CatalogRouterInput?
    var presenter: CatalogPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        view.addSubview(finishFlow)
        finishFlow.frame = CGRect(x: 150, y: 400, width: 100, height: 50)
    }
    
    
    @objc func didTapButton() {
        router?.finishFlow()
    }
}

protocol CatalogPresenterProtocol: AnyObject {}

final class CatalogPresenter: CatalogPresenterProtocol {
    weak var viewController: CatalogViewProtocol?
    
    private let networkService: Networkable
    
    init(networkService: Networkable) {
        self.networkService = networkService
    }
}

protocol CatalogRouterInput: AnyObject {
    func finishFlow()
}

