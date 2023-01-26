//
//  Presentor.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 23.01.2023.
//

import Foundation

final class Presenter {
    //у презентера слабая ссылка на вью, у вьюхи есть сильная ссылка на презентер
    weak var view: ViewInput!
    weak var router: RouterInput!
    var interactor: InteractorInput!
}

extension Presenter: ViewOutput {
    func viewDidLoad() {
        
    }
    
    func didTapButton() {
        interactor.fetchData()
    }
}

extension Presenter: InteractorOutput {
    func didSucsessFetchData(viewData: Data) {
        router.finishFlow()
    }
    
    func didFailureFetchData() {
        view.updateView()
    }
}
