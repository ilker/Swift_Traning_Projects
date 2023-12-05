//
//  LoginViewModel.swift
//  ToDoApp
//
//  Created by ILKER on 17.11.2023.
//

import UIKit

struct LoginViewModel {
    var emailText: String?
    var passwordText: String?
    
    var status: Bool {
        return emailText?.isEmpty == false && passwordText?.isEmpty == false
    }
}

