//
//  ProfileView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        // Picture
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72, alignment: .center)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            // Name
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            // Email
                            Text(user.email)
                                .font(.footnote)
                                .accentColor(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                }
                
                Section("Account") {
                    
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(
                            imageName: "arrow.left.circle.fill",
                            title: "Sign Out",
                            tintColor: Color(.red)
                        )
                    }
                    
                    Button {
                        print("TODO: Delete Account")
                    } label: {
                        SettingsRowView(
                            imageName: "xmark.circle.fill",
                            title: "Delete Account",
                            tintColor: Color(.red)
                        )
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
