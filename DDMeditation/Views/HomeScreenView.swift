//
//  HomeScreenView.swift`
//  DDMeditation
//
//  Created by joe on 9/3/25.
//

import SwiftUI

struct HomeScreenView: View {
    let homeScreen = "Home Screen"
    let chips = [
        "Sweet sleep",
        "Insomnia",
        "Depression"
    ]
    
    var body: some View {
        ZStack {
            deepBlue.ignoresSafeArea()
            
            VStack {
                GreetingsView(name: "Ron")
                
                ChipsView(chips: chips)
                
                CurrentMeditationView()
                
                AnotherView()
                
                Spacer()
            }
        }
    }
}

struct CurrentMeditationView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Daily Thought")
                    .foregroundStyle(textWhite)
                    .fontWeight(.semibold)
                Text("Meditation 3-10 min")
                    .foregroundStyle(textWhite)
                    .font(.caption)
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundStyle(textWhite)
                .background(buttonBlue)
                .clipShape(Circle())
                .padding()
        }
        .background(lightRed)
        .clipShape(.rect(cornerRadius: 10))
        .padding()
    }
}

struct AnotherView: View {
    var body: some View {
        Text("AnotherView")
            .foregroundStyle(textWhite)
            .fontWeight(.semibold)
    }
}

struct ChipsView: View {
    let chips: [String]
    @State private var selectedChipIndex = 0
    
    var body: some View {
        HStack {
            ForEach(0 ..< chips.count, id: \.self) { i in
                Text(chips[i])
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background {
                        i == selectedChipIndex ? buttonBlue : darkerButtonBlue
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .foregroundStyle(textWhite)
                    .font(.footnote)
                    .onTapGesture {
                        selectedChipIndex = i
                    }
            }
            
            Spacer()
        }
        .padding()
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
