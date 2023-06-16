//
//  MainViewModel.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import Foundation

class MainViewModel {
    
    func getData() {
        Service.getData()
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return 10
    }
    func numberOfSection() -> Int {
        return 1
    }
}
