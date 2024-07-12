//
//  RegistrationView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel = RegistrationViewModel()

    
    // MARK: - Main View
    // —————————————————
    var body: some View {
        VStack {
            logoImageView
            formFieldsView
            signUpButton
            Spacer()
            signInButton
        }
    }
}

// MARK: - Subviews
// ————————————————

extension RegistrationView {
    
    // Logo
    var logoImageView: some View {
            Image("Corail")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.vertical, 32)
    }
    
    // Form fields
    var formFieldsView: some View {
        
        VStack(spacing: 24) {
            // Email
            ImputView( text: $viewModel.email,
                       title: "Email Address",
                       placeholder: "name@example.com"
            )
            .autocapitalization(.none)
            
            // Full Name
            ImputView( text: $viewModel.fullName,
                       title: "Enter your name",
                       placeholder: "John Doe"
            )
            
            // Password
            ImputView( text: $viewModel.password,
                       title: "Password",
                       placeholder: "Enter your password",
                       isSecuredField: true
            )
            .autocapitalization(.none)
            
            // Confirmed Password
            ZStack(alignment: .trailing) {
                ImputView( text: $viewModel.confirmPassword,
                           title: "Confirm Password",
                           placeholder: "Confirm your password",
                           isSecuredField: true
                )
                .autocapitalization(.none)
                
                if !viewModel.password.isEmpty
                    && viewModel.password == viewModel.confirmPassword {
                    Image(systemName: "checkmark")
                        .foregroundColor(.green)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
    }
    
    // Sign up Button
    var signUpButton: some View {
        Button {
            viewModel.createUser()
        } label: {
            HStack {
                Text("Sign Up").fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }.foregroundColor(.white)
                .frame( width: UIScreen.main.bounds.width - 32,
                        height: 48)
        }
        .background(Color(.systemBlue))
        .disabled(!viewModel.formIsValid)
        .opacity(viewModel.formIsValid ? 1.0 : 0.5)
        .cornerRadius(10)
        .padding(.top, 24)
    }
    
    // // Sign in button
    var signInButton: some View {
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

// MARK: - Preview
// ———————————————

#Preview {
    RegistrationView()
}
