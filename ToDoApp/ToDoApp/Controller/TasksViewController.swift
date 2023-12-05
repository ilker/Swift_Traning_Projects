//
//  TasksViewController.swift
//  ToDoApp
//
//  Created by ILKER on 23.11.2023.
//

import UIKit
import FirebaseAuth

class TasksViewController: UIViewController {
    // MARK: - Properties
    private lazy var newTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.diamond.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleNewTaskButton), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
}
// MARK: - Selector
extension TasksViewController {
    @objc private func handleNewTaskButton() {
        let controller = NewTaskViewController()
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(controller, animated: true)
    }
}
// MARK: - Helpers
extension TasksViewController {
    private func style() {
        backgroundGradientColor()
        newTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func layout() {
        view.addSubview(newTaskButton)
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: newTaskButton.bottomAnchor, constant: 30),
            view.trailingAnchor.constraint(equalTo: newTaskButton.trailingAnchor, constant: 4),
            newTaskButton.heightAnchor.constraint(equalToConstant: 60),
            newTaskButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
