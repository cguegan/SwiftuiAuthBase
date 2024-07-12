//
//  User.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    
    let id: String
    let fullName: String
    let email: String
    let profilePicture: String?
    
    // Initials of the current user
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
}

extension User {
    static var sample = User(
        id: UUID().uuidString,
        fullName: "John Doe",
        email: "captain@silverware.com",
        profilePicture: "https://randomuser.me/api/portraits/men/1.jpg"
    )
}
