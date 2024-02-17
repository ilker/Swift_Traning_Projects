//
//  ViewController.swift
//  CryptoCrazyRxMVVM
//
//  Created by ILKER on 17.02.2024.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    let cryptoViewModel = CryptoViewModel()
    let disposeBag = DisposeBag()
    var cryptoList = [Crypto]()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
// MARK: - Helpers
extension ViewController {
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        cryptoViewModel.requestData()
        setupBindings()
    }
    private func setupBindings() {
        cryptoViewModel
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                print(errorString)
            }
            .disposed(by: disposeBag)
        cryptoViewModel
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
                self.cryptoList = cryptos
                self.tableView.reloadData()
            }
            .disposed(by: disposeBag)
    }
}
// MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = cryptoList[indexPath.row].currency
        content.secondaryText = cryptoList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
}

