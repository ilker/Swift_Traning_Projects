//
//  RegisterViewModel.swift
//  ToDoApp
//
//  Created by ILKER on 18.11.2023.
//

import UIKit
struct RegisterViewModel {
    var nameText: String?
    var userNameText: String?
    var emailText: String?
    var passwordText: String?
    
    var status: Bool {
        return nameText?.isEmpty == false && userNameText?.isEmpty == false && emailText?.isEmpty == false && passwordText?.isEmpty == false
    }
}
