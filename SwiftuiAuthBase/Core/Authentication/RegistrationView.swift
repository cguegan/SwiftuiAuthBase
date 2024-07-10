//
//  RegistrationView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.dismiss) var dismiss
    
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
                
                ImputView( text: $confirmPassword,
                           title: "Confirm Password",
                           placeholder: "Confirm your password",
                           isSecuredField: true
                )
                .autocapitalization(.none)
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // Sign up Button
            Button {
                print("Sign user Up")
            } label: {
                HStack {
                    Text("SIGN UP").fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }.foregroundColor(.white)
                    .frame( width: UIScreen.main.bounds.width - 32,
                            height: 48)
            }
            .background(Color(.systemBlue))
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

#Preview {
    RegistrationView()
}
