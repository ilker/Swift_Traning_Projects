//
//  TasksCell.swift
//  ToDoApp
//
//  Created by ILKER on 6.12.2023.
//

import UIKit

class TasksCell: UICollectionViewCell {
    // MARK: - Properties
    private lazy var circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .mainColor
        button.addTarget(self, action: #selector(handleCircleButton), for: .touchUpInside)
        return button
    }()
    private let taskLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Meyve al."
        return label
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Selector
extension TasksCell {
    @objc private func handleCircleButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.circleButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.circleButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                self.circleButton.alpha = 1
            }
        }

    }
}
// MARK: - Helpers
extension TasksCell {
    private func style() {
        backgroundColor = .white
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 5
        circleButton.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout() {
        addSubview(circleButton)
        addSubview(taskLabel)
        NSLayoutConstraint.activate([
            circleButton.heightAnchor.constraint(equalToConstant: 50),
            circleButton.widthAnchor.constraint(equalToConstant: 50),
            circleButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            taskLabel.leadingAnchor.constraint(equalTo: circleButton.trailingAnchor, constant: 8),
            taskLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            taskLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
