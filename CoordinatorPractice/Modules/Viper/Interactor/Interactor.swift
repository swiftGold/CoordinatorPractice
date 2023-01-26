//
//  Interactor.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 23.01.2023.
//

final class Interactor {
    private let networkService: Networkable
    
    weak var output: InteractorOutput!
    
    init(networkService: Networkable) {
        self.networkService = networkService
    }
}

extension Interactor: InteractorInput {
    func fetchData() {
        print(#function)
        do {
            let data = try networkService.method()
            output.didSucsessFetchData(viewData: data)
        } catch {
            output.didFailureFetchData()
        }
    }
}
