//
//  Extension.swift
//  ToDoApp
//
//  Created by ILKER on 16.11.2023.
//

import UIKit
import JGProgressHUD
extension UIViewController {
    func backgroundGradientColor() {
        let graident = CAGradientLayer()
        graident.colors = [UIColor(red: 0.18, green: 0.80, blue: 0.44, alpha: 1.00).cgColor, UIColor(red: 0.15, green: 0.68, blue: 0.38, alpha: 1.00).cgColor]
        graident.locations = [0,1]
        graident.frame = view.bounds
        view.layer.addSublayer(graident)
    }
    func showHud(show: Bool) {
        view.endEditing(true)
        let jgProgressHud = JGProgressHUD(style: .dark)
        jgProgressHud.textLabel.text = "Loading"
        jgProgressHud.detailTextLabel.text = "Please Wait"
        if show {
            jgProgressHud.show(in: view)
        }else {
            jgProgressHud.dismiss(animated: true)
        }
    }
}

extension UIColor {
    static let mainColor = UIColor.systemGreen.withAlphaComponent(0.7)
}
