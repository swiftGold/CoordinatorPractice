//
//  InteractorOutput.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 23.01.2023.
//

import Foundation

protocol InteractorOutput: AnyObject {
    func didSucsessFetchData(viewData: Data)
    func didFailureFetchData() 
}
