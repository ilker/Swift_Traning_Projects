//
//  Extension.swift
//  ToDoList
//
//  Created by ILKER on 29.06.2023.
//

import UIKit

extension UIViewController {
    func backgroundGraidentColor() {
        let graident = CAGradientLayer()
        graident.colors = [UIColor(red: 0.56, green: 0.93, blue: 0.56, alpha: 1.00).cgColor, UIColor(red: 0.33, green: 0.42, blue: 0.18, alpha: 1.00).cgColor]
        graident.locations = [0,1]
        graident.frame = view.bounds
        view.layer.addSublayer(graident)
    }
}
