//
//  FollowApp.swift
//  Follow
//
//  Created by Augusto Simionato on 10/04/23.
//

import SwiftUI

@main
struct FollowApp: App {
    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(ProfileViewModel())
        }
    }
}
