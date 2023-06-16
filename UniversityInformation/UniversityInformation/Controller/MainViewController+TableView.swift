//
//  MainViewController+TableView.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import UIKit
private let reuseIdentifier = "cell"
extension MainViewController {
    func registerTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSection()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row)"
        cell.contentConfiguration = content
        return cell
    }
}
