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
        print(#function)
    }
    
    func didTapButton() {
        print(#function)
        interactor.fetchData()
    }
}

extension Presenter: InteractorOutput {
    func didSucsessFetchData(viewData: Data) {
        print(#function)
        router.finishFlow()
    }
    
    func didFailureFetchData() {
        print(#function)
        view.updateView()
    }
}
