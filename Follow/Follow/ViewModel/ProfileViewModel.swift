//
//  ProfileViewModel.swift
//  Follow
//
//  Created by Augusto Simionato on 10/04/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var isNotFollowing = true
    @Published var userFollowers = String()
    
    var user = User(picture: "profile-picture",
                    name: "Fábio Rocha",
                    nickName: "@rocha_fabio",
                    followers: 22643)
    
    init() {
        loadFollowers()
    }
    
    func followToggle() {
        self.isNotFollowing.toggle()
        self.isNotFollowing ? (self.user.followers -= 1) : (self.user.followers += 1)
        loadFollowers()
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    func loadFollowers() {
        self.userFollowers = customizeNumber(value: user.followers)
    }
}
