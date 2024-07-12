//
//  LoginView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var viewModel = LoginViewModel()
    
    // MARK: - Main View
    // —————————————————
    var body: some View {
        NavigationStack {
            VStack {
                logoImageView
                formFieldsView
                
                // TODO: - Forgot password
                
                forgotPasswordButton
                signInButton
                Spacer()
                signUpButton
            }
        }
    }
}


// MARK: - Subviews
// ————————————————

extension LoginView {
    
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
            
            // Password
            ImputView( text: $viewModel.password,
                       title: "Password",
                       placeholder: "Enter your password",
                       isSecuredField: true
            )
            .autocapitalization(.none)
            
        }
        .padding(.horizontal)
        .padding(.top, 12)
        
    }
    
    // Forgot Password
    var forgotPasswordButton: some View {
        NavigationLink {
            //TODO: Implement forgot password
            Text("TODO: Implement forgot password")
        } label: {
            HStack(spacing: 4) {
                Text("Forgot your password?")
                    .font(.caption)
            }
        }
        .padding(.top)
        .frame( width: UIScreen.main.bounds.width - 32,
                alignment: .trailing)
    }
       
    // Sign in Button
    var signInButton: some View {
        Button {
            viewModel.signIn()
        } label: {
            HStack {
                Text("SIGN IN")
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .frame( width: UIScreen.main.bounds.width - 32,
                    height: 48)
        }
        .background(Color(.systemBlue))
        .disabled(!viewModel.formIsValid)
        .opacity(viewModel.formIsValid ? 1.0 : 0.5)
        .cornerRadius(10)
        .padding(.top, 24)
    }
    
    // Sign up button
    var signUpButton: some View {
        NavigationLink {
            RegistrationView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack(spacing: 4) {
                Text("Don't have an account?")
                Text("Sign Up")
                    .bold()
            }
        }
    }
    
}


// MARK: - Preview
// ———————————————

#Preview {
    LoginView()
}
