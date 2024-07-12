//
//  ContentView.swift
//  SwiftuiAuthBase
//
//  Created by Christophe Guégan on 10/07/2024.
//

import SwiftUI

struct ContentView: View {
        
    // MARK: - Main View
    // —————————————————
    var body: some View {
        Group {
            if AuthService.shared.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}


// MARK: - Preview
// ———————————————

#Preview {
    ContentView()
}
