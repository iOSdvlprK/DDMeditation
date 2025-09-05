//
//  HomeScreenView.swift
//  DDMeditation
//
//  Created by joe on 9/3/25.
//

import SwiftUI

struct HomeScreenView: View {
    let homeScreen = "Home Screen"
    
    var body: some View {
        ZStack {
            deepBlue.ignoresSafeArea()
            
            VStack {
                GreetingsView(name: "Ron")
                
                Spacer()
            }
        }
    }
}

struct GreetingsView: View {
    let name: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Good morning, \(name).")
                    .foregroundStyle(textWhite)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("Have a great day!")
                    .foregroundStyle(textWhite)
                    .font(.subheadline)
                    .fontWeight(.thin)
            }
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(textWhite)
        }
        .padding()
    }
}

#Preview {
    HomeScreenView()
}
