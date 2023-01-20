//
//  Router.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 18.01.2023.
//

import UIKit

protocol Router: AnyObject {
    func setRoot(_ viewController: UIViewController)
    func push(_ viewController: UIViewController, animated: Bool)
    func popToRoot(animated: Bool)
}
