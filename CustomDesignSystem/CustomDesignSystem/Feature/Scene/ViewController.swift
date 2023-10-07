//
//  ViewController.swift
//  CustomDesignSystem
//
//  Created by Paolo Prodossimo Lopes on 25/05/22.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = DSText(type: .label(.default(.positive(.xxSmall(.regular)))))
        label.text = "Olá"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
