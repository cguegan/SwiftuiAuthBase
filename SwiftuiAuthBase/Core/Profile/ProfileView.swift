//
//  ProfileView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    // Picture
                    Text(User.sample.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 72, height: 72, alignment: .center)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        // Name
                        Text(User.sample.fullName)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        // Email
                        Text(User.sample.email)
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
                    print("TODO: Signing out")
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

#Preview {
    ProfileView()
}
