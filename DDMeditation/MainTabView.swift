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
            Tab("Home", systemImage: "house") {
                HomeScreenView()
            }
            
            Tab("Meditate", systemImage: "drop") {
                MeditateScreenView()
            }
            
            Tab("Sleep", systemImage: "moon") {
                SleepScreenView()
            }
            
            Tab("Music", systemImage: "music.note") {
                MusicView()
            }
            
            Tab("Profile", systemImage: "person") {
                ProfileView()
            }
        }
    }
}

#Preview {
    MainTabView()
}
