//
//  ContentView.swift
//  Follow
//
//  Created by Augusto Simionato on 10/04/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isNotFollowing)
    }
}

struct ProfileDataView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
//        MARK: Profile
        Image(viewModel.user.picture)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
        
        Text(viewModel.user.name)
            .font(.system(size: 45, weight: .bold))
        
        Text(viewModel.user.nickName)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text(viewModel.userFollowers)
            .font(.system(size: 50, weight: .light))
            .padding(viewModel.isNotFollowing ? 25 : 40)
    }
}

struct ActionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
//        MARK: Buttons
        VStack {
            Button {
                viewModel.followToggle()
            } label: {
                Image(systemName: viewModel.isNotFollowing ? "person.badge.plus" : "person.badge.minus")
                Text(viewModel.isNotFollowing ? "Follow" : "Unfollow")
            }
            .font(.title3)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(viewModel.isNotFollowing ? .blue : .black)
            
            Button {
                
            } label: {
                Image(systemName: "paperplane.circle.fill")
                Text("Send message")
            }
            .font(.title3)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(viewModel.isNotFollowing)
        }
        .padding(10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
    }
}
