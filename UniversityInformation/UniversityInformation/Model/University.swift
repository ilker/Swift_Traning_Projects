//
//  University.swift
//  UniversityInformation
//
//  Created by ILKER on 16.06.2023.
//

import Foundation

struct University: Decodable {
    let webPages: [String]
    let country: String
    let domains: [String]
    let name: String
    
    private enum CodignKeys: String, CodingKey {
        case country, domains, name
        case webPages = "web_pages"
    }
}
