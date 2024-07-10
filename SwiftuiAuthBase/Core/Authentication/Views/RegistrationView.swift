//
//  RegistrationView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    
    var body: some View {
        VStack {
            // Image
            Image("Corail")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.vertical, 32)
            
            // Form fields
            VStack(spacing: 24) {
                ImputView( text: $email,
                           title: "Email Address",
                           placeholder: "name@example.com"
                )
                .autocapitalization(.none)
                
                ImputView( text: $fullName,
                           title: "Enter your name",
                           placeholder: "John Doe"
                )
                
                ImputView( text: $password,
                           title: "Password",
                           placeholder: "Enter your password",
                           isSecuredField: true
                )
                .autocapitalization(.none)
                
                ZStack(alignment: .trailing) {
                    ImputView( text: $confirmPassword,
                               title: "Confirm Password",
                               placeholder: "Confirm your password",
                               isSecuredField: true
                    )
                    .autocapitalization(.none)
                    
                    if !password.isEmpty
                        && password == confirmPassword {
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // Sign up Button
            Button {
                Task {
                    try await viewModel.createUser( withEmail: email,
                                                    password: password,
                                                    fullName: fullName )
                }
            } label: {
                HStack {
                    Text("SIGN UP").fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }.foregroundColor(.white)
                    .frame( width: UIScreen.main.bounds.width - 32,
                            height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            // Sign in button
            Button {
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .bold()
                }
            }
        }
        
    }
}

extension RegistrationView: AuthenticationFormProtocol {
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

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
