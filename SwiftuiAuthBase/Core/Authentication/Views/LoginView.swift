//
//  LoginView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
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
                    
                    ImputView( text: $password,
                               title: "Password",
                               placeholder: "Enter your password",
                               isSecuredField: true
                    )
                    .autocapitalization(.none)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // Forgot password
                // Sign up button
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
                
                // Sign in Button
                Button {
                    Task {
                        try await viewModel.signIn( withEmail: email,
                                                    password: password )
                    }
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
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                
                // Sign up button
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
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}