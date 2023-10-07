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
        DSUIConfigurator.setup(DSDarkerTheme())
        let label = DSText(type: .label(.default(.positive(.xxLarge(.thin)))))
//        let config: DSText.Configurator = .init(
//            option: .label,
//            variant: .default,
//            style: .positive,
//            state: .disable,
//            size: .medium,
//            weight: .bold
//        )
//        let label = DSText(config: config)
        label.text = "Olá"

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
//        let button = DSButton(
//            option: .rectangle(
//                .rounded(
//                    .default(
//                        .secundary(
//                            .medium(
//                                .rectangle))))))
//        button.setTitle("Ola", for: .normal)
//        view.addSubview(button)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
