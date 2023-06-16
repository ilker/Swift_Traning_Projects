//
//  ViewController.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import UIKit

class MainViewController: UITableViewController {
    // MARK: - Properties
    var dataResult: [University] = [] {
        didSet{ tableView.reloadData() }
    }
    var viewModel = MainViewModel()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
// MARK: - Helpers
extension MainViewController {
    private func configureView() {
        view.backgroundColor = .white
    }
    private func configureNavigaiton() {
        self.navigationItem.title = "University"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setup() {
        configureView()
        registerTableView()
        getData()
        configureNavigaiton()
    }
    func getData() {
        viewModel.getData {[weak self] result in
            guard let self = self else { return }
            guard let resultData = result else { return }
            self.dataResult = resultData
        }
    }
    func createMainCellViewModel(model: University) -> MainViewCellViewModel {
        let cellModel = MainViewCellViewModel(model: model)
        return cellModel
    }
}
