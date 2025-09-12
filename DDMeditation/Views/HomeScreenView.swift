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

struct MeditateScreenView: View {
    var body: some View {
        ZStack {
            deepBlue.ignoresSafeArea()

            Text("MeditateScreenView")
                .foregroundStyle(textWhite)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

struct SleepScreenView: View {
    var body: some View {
        ZStack {
            lightRed.ignoresSafeArea()

            Text("SleepScreenView")
                .foregroundStyle(textWhite)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

struct MusicView: View {
    var body: some View {
        ZStack {
            lightGreen1.ignoresSafeArea()

            Text("MusicView")
                .foregroundStyle(textWhite)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack {
            aquaBlue.ignoresSafeArea()

            Text("ProfileView")
                .foregroundStyle(textWhite)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding()
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

struct Feature: Identifiable {
    let id = UUID()
    let lightColor: Color
    let mediumColor: Color
    let darkColor: Color
    let title: String
    let iconName: String
}

struct FeatureView: View {
    let columns: [GridItem] = Array(repeating: GridItem(.fixed(UIScreen.width / 2), spacing: 0), count: 2)
    let colors: [Color] = [
        blueViolet1, lightGreen1,orangeYellow1, orangeYellow3
    ]
    let titles: [String] = [
        "Sleep meditation", "Tips for sleeping", "Night island", "Calming sounds"
    ]
    
    let featureList = [
        Feature(
            lightColor: blueViolet1,
            mediumColor: blueViolet2,
            darkColor: blueViolet3,
            title: "Sleep meditation",
            iconName: "music.note"
        ),
        Feature(
            lightColor: lightGreen1,
            mediumColor: lightGreen2,
            darkColor: lightGreen3,
            title: "Tips for sleeping",
            iconName: "video"
        ),
        Feature(
            lightColor: orangeYellow1,
            mediumColor: orangeYellow2,
            darkColor: orangeYellow3,
            title: "Night island",
            iconName: "leaf"
        ),
        Feature(
            lightColor: beige1,
            mediumColor: beige2,
            darkColor: beige3,
            title: "Calming sounds",
            iconName: "heart"
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured")
                .foregroundStyle(textWhite)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(featureList) { feature in
                        FeatureItemView(
                            lightColor: feature.lightColor,
                            mediumColor: feature.mediumColor,
                            darkColor: feature.darkColor,
                            title: feature.title,
                            iconName: feature.iconName
                        )
                    }
                }
            }
        }
    }
}

struct FeatureItemView: View {
    let lightColor: Color
    let mediumColor: Color
    let darkColor: Color
    let title: String
    let iconName: String
    
    let width = UIScreen.width
    var halfWidth: CGFloat { width / 2 }
    var boxDim: CGFloat { 0.8 * halfWidth }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [lightColor, mediumColor, darkColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: boxDim, height: boxDim)
                .clipShape(.rect(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(title)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(textWhite)
                    .font(.body)
                    .padding()
                
                Spacer()
                
                HStack {
                    Image(systemName: iconName)
                        .imageScale(.large)
                        .foregroundStyle(textWhite)
                    
                    Spacer()
                    
                    Text("Start")
                        .foregroundStyle(textWhite)
                        .font(.body)
                        .padding(5)
                        .background(buttonBlue)
                        .clipShape(.rect(cornerRadius: 5))
                }
                .padding()
            }
            .frame(width: boxDim, height: boxDim, alignment: .leading)
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
