//
//  Kevin_TestApp.swift
//  Kevin_Test
//
//  Created by Kevin on 19/11/22.
//

import SwiftUI

@main
struct Kevin_TestApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    var body: some View {
        TabView {
            NewArrivalsView()
                .tabItem {
                    Image("Home").renderingMode(.template)
                }

            Text("favourite").font(.largeTitle.bold())
                .tabItem {
                    Image("Favorites").renderingMode(.template)
                }
            Text("Cart").font(.largeTitle.bold())
                .tabItem {
                    Image("Cart").renderingMode(.template)
                }
            Text("Profile").font(.largeTitle.bold())
                .tabItem {
                    Image("UserIcon").renderingMode(.template)
                }
        }.accentColor(.PrimaryColor)
            .toolbarColorScheme(.light, for: .tabBar)
            .edgesIgnoringSafeArea(.top)
            .onAppear() {
                UITabBar.appearance().barTintColor = .white
                UITabBar.appearance().layer.borderWidth = 0.1
                UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
            }
    }
   
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
