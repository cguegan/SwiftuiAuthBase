//
//  AuthService.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 11/07/2024.
//

import Foundation
import Firebase
import FirebaseFirestore

@Observable
final class AuthService {
    
    var userSession: FirebaseAuth.User?
    var currentUser: User?
    
    static let shared = AuthService()
    
    /// Private init
    /// Not Accessible from outstide because of the singleton pattern used here
    
    private init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    /// Sign In
    /// 
    /// - Parameters:
    ///   - email: String - Email address of the new user
    ///   - password: String - Chosen password   
    
    func signIn(withEmail email: String, password: String) async throws {
        print("DEBUG: Sign in ...")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            await fetchUser()
        } catch {
            print("ERROR: failed to login the user with error: \(error.localizedDescription)")
        }
    }
    
    /// Create User
    /// 
    /// - Parameters:
    ///   - email: String - Email address of the new user
    ///   - password: String - Chosen password
    ///   - fullName: String - Full name of the new user
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        print("DEBUG: create user ...")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid,
                            fullName: fullName,
                            email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("ERROR: failed to create the user with error: \(error.localizedDescription)")
        }
    }
    
    /// Sign Out
    ///
    
    func signOut() {
        print("DEBUG: Sign out ...")
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("ERROR: failed to logout the user with error: \(error.localizedDescription)")
        }
    }
    
    /// Delete account
    ///
    
    func deleteAccount() {
        print("DEBUG: Delete Account ...")
    }
    
    /// Fetch user
    ///
    
    func fetchUser() async {
        print("DEBUG: Fetch user ...")
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            let user = try snapshot.data(as: User.self)
            self.currentUser = user
        } catch  {
            print("ERROR: failed to fetch the user with error: \(error.localizedDescription)")
        }
    }
    
    /// Forgot Password
    ///
    
    func forgotPassword() async {
        print("DEBUG: Forgot password ...")
    }
    
    /// Change Password
    ///
    
    func changePassword() async {}
    
}
