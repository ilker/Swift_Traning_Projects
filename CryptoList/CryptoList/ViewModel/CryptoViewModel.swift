//
//  CryptoViewModel.swift
//  CryptoList
//
//  Created by ILKER on 4.06.2023.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrenciesList : [CryptoCurrency]
}

extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrenciesList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrenciesList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}


