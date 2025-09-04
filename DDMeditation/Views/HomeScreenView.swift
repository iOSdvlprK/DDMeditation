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
            Text(homeScreen)
                .foregroundStyle(textWhite)
                .font(.largeTitle)
        }
    }
}

#Preview {
    HomeScreenView()
}
