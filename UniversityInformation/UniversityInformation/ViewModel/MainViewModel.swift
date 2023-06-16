//
//  MainViewModel.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import Foundation

class MainViewModel {
    
    var dataResult: [University] = []
    
    func getData(completion: @escaping([University]) -> Void) {
        Service.getData { result in
            switch result {
            case .success(let dataResult):
                self.dataResult = dataResult
                completion(dataResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.dataResult.count
    }
    func numberOfSection() -> Int {
        return 1
    }
}
