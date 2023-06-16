//
//  MainViewCellViewModel.swift
//  UniversityInformation
//
//  Created by ILKER on 17.06.2023.
//

import UIKit
struct MainViewCellViewModel {
    private let model: University
    init(model: University) {
        self.model = model
    }
    var url: URL? {
        return URL(string: model.webPages.first ?? "https://google.com")
    }
    var name: String? {
        return model.name
    }
}
