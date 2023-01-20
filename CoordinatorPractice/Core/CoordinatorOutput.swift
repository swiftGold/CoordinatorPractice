//
//  CoordinatorOutput.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 18.01.2023.
//

protocol CoordinatorOutput: Coordinator {
    var onFinish: (() -> Void)? { get set }
}
