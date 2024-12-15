//
//  MainViewController.swift
//  UniversityInformation
//
//  Created by ILKER on 15.12.2024.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Properties
    let viewModel = MainViewModel()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
// MARK: - Helpers
extension MainViewController {
    private func configureView() {
        view.backgroundColor = .red
    }
    func setup() {
        configureView()
        registerTableView()
    }
}
