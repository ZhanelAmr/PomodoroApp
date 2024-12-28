//
//  ContentView.swift
//  PomodoroFullApp
//
//  Created by Zhanel Amralina on 8/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 1
    
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .darkGray
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MainTab1View()
                .tabItem {
                    Image(systemName: "house.circle")
                        .renderingMode(.template)
                        .accentColor(.white)
                    Text("Main")
                        .foregroundColor(.white)
                }
                .accentColor(.gray)
                .tag(1)
            
            Settings()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                        .renderingMode(.template)
                        .accentColor(.white)
                    Text("Settings")
                        .foregroundColor(.white)
                }
                .accentColor(.gray)
                .tag(2)
            
            History()
                .tabItem {
                    Image(systemName: "doc")
                        .renderingMode(.template)
                        .accentColor(.white)
                    Text("History")
                        .foregroundColor(.white)
                }
                .accentColor(.white)
                .tag(3)
        }
        .accentColor(Color.gray)
    }
}

extension UITabBarController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundImage = UIImage(named: "BG")
        tabBar.standardAppearance = standardAppearance
        standardAppearance.configureWithTransparentBackground()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
