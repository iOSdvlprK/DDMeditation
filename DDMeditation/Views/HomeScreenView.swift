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
                
                FeatureView()
                
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

struct FeatureView: View {
    let width = UIScreen.width
    var halfWidth: CGFloat { width / 2 }
    var boxDim: CGFloat { 0.9 * halfWidth }
    
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(190), spacing: 0), count: 2)
    let colors: [Color] = [
        blueViolet1, lightGreen1,orangeYellow1, orangeYellow3
    ]
    let titles: [String] = [
        "Sleep meditation", "Tips for sleeping", "Night island", "Calming sounds"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Feature")
                .foregroundStyle(textWhite)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding()
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0 ..< colors.count, id: \.self) { i in
                    ZStack {
                        Rectangle()
                            .fill(colors[i])
                            .frame(width: boxDim, height: boxDim)
                            .clipShape(.rect(cornerRadius: 10))
                        
                        VStack(alignment: .leading) {
                            Text(titles[i])
                                .foregroundStyle(textWhite)
                                .font(.footnote)
                                .padding()
                            
                            Spacer()
                        }
                    }
                }
            }
        }
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
