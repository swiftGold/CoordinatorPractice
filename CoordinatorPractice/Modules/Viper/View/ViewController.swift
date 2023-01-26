//
//  ViewController.swift
//  CoordinatorPractice
//
//  Created by Сергей Золотухин on 23.01.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var finishFlow: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("finish flow", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 16
        return button
    }()
    
    //в вайпере не делают опционалов, а делают force unwrap
    //у вьюхи есть сильная ссылка на презентер, у презентера слабая ссылка на вью
    var output: ViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(finishFlow)
        finishFlow.frame = CGRect(x: 150, y: 400, width: 100, height: 50)
        output.viewDidLoad()
    }
    
    @objc func didTapButton() {
        output.didTapButton()
    }
}

extension ViewController: ViewInput {
    func updateView() {
        print(#function)
    }
}
