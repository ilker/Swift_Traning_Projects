//
//  ViewController.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Properties
    var viewModel = MainViewModel()
    var dataResult: [University] = [] {
        didSet{ tableView.reloadData() }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
// MARK: - Helpers
extension MainViewController {
    private func configureView() {
        
    }
    func setup() {
        configureView()
        registerTableView()
        getData()
    }
    func getData() {
        viewModel.getData { result in
            self.dataResult = result
        }
    }
}
