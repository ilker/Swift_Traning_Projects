//
//  ViewController.swift
//  CryptoList
//
//  Created by ILKER on 4.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var cryptoListViewModel : CryptoListViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getData()
        
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrenciesList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let  cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.currencyText.text = cryptoViewModel.name
        cell.priceText.text = cryptoViewModel.price
        
        return cell
    }
    
    
}

