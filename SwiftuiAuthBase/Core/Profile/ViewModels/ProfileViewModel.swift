//
//  ProfileViewModel.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 12/07/2024.
//

import Foundation

@Observable
class ProfileViewModel {
    
    var user: User
    
    init() {
        if let user = AuthService.shared.currentUser {
            _user = user
        } else {
            //_user = User.init(id: "", fullName: "", email: "", profilePicture: "")
            _user = User.sample
        }
    }
}
