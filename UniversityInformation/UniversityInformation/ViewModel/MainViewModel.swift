//
//  MainViewModel.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import Foundation

class MainViewModel {
    var dataResult: [University] = []
    func getData(completion: @escaping([University]?)->Void) {
        Service.getData {[weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let dataResult):
                self.dataResult = dataResult
                completion(self.dataResult)
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
