//
//  LoginViewModel.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 11/07/2024.
//

import Foundation

@Observable
class LoginViewModel {
    
    var email: String = ""
    var password: String = ""
    
    /// Sign In User
    ///
    
    func signIn() {
        Task {
            do {
                guard formIsValid else { return }
                try await AuthService.shared.signIn(withEmail: email, password: password)
            } catch {
                print("DEBUG: Error login user: \(error.localizedDescription)")
            }
        }
    }
    
    /// Validate the form elements
    ///
    
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
    
    

}
