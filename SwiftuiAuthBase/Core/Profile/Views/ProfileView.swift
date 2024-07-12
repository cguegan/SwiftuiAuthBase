//
//  ProfileView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var viewModel = ProfileViewModel()
    
    // MARK: - Main View
    // —————————————————
    var body: some View {
        if !viewModel.user.id.isEmpty {
            List {
                topUserProfileView
                generalSection
                accountSection
            }
        }
    }
}

extension ProfileView {
    
    // Top User Profile View
    var topUserProfileView: some View {
        Section {
            HStack {
                // Picture
                Text(viewModel.user.initials)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 72, height: 72, alignment: .center)
                    .background(Color(.systemGray3))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    // Name
                    Text(viewModel.user.fullName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                    
                    // Email
                    Text(viewModel.user.email)
                        .font(.footnote)
                        .accentColor(.gray)
                }
            }
        }
    }
    
    // General Section
    var generalSection: some View {
        Section("General") {
            HStack {
                SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                Spacer()
                Text("1.0.0")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
    
    // Account Section View
    var accountSection: some View {
        Section("Account") {
            Button {
                AuthService.shared.signOut()
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


// MARK: - Preview
// ———————————————

#Preview {
    ProfileView()
}
