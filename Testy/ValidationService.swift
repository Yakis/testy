//
//  ValidationService.swift
//  Testy
//
//  Created by Mugurel Moscaliuc on 13/07/2021.
//

import Foundation


enum ValidationError: LocalizedError {
    case usernameEmpty
    case passwordEmpty
    case passwordTooLong
    case passwordTooShort
    case usernameTooLong
    case usernameTooShort
    
    
    var errorDescription: String? {
        switch self {
        case .usernameEmpty:
            return "Username is empty."
        case .passwordEmpty:
            return "Password is empty."
        case .passwordTooLong:
            return "Your password is too long."
        case .passwordTooShort:
            return "Your password is too short."
        case .usernameTooLong:
            return "Your username is too long."
        case .usernameTooShort:
            return "Your username is too short."
        }
    }
    
}


struct ValidationService {
    
    
    func validate(username: String) throws -> String {
        guard !username.isEmpty else { throw ValidationError.usernameEmpty }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        return username
    }
    
    
    func validate(password: String) throws -> String {
        guard !password.isEmpty else { throw ValidationError.passwordEmpty }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        return password
    }
    
}
