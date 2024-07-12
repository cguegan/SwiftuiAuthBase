//
//  RegistrationViewModel.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 11/07/2024.
//

import Foundation

@Observable
class RegistrationViewModel {
    
    var email: String = ""
    var fullName: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    /// Create User
    ///

    func createUser() {
        Task {
            do {
                guard formIsValid else { return }
                try await AuthService.shared.createUser( withEmail: email,
                                                    password: password,
                                                    fullName: fullName )
            } catch {
                print("DEBUG: Error creating user: \(error.localizedDescription)")
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
        && password == confirmPassword
        && !fullName.isEmpty
        && fullName.components(separatedBy: " ").count > 1
    }
    
}
