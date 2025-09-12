//
//  MainTabView.swift
//  DDMeditation
//
//  Created by joe on 9/12/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            MeditateScreenView()
                .tabItem {
                    Label("Meditate", systemImage: "drop")
                }
            
            SleepScreenView()
                .tabItem {
                    Label("Sleep", systemImage: "moon")
                }
            
            MusicView()
                .tabItem {
                    Label("Music", systemImage: "music.note")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainTabView()
}
