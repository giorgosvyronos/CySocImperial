//
//  CySocApp.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 18/07/2021.
//  Copyright © 2021 Giorgos Vyronos. All rights reserved.
//

import SwiftUI

@main
struct CySocApp: App {
    
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView{
                    HomeView()
                }
                .tabItem{
                    Image(systemName: "hexagon.fill")
                    Text("Home")
                }
                
                NavigationView{
                    AnnouncementView()
                }
                .tabItem{
                    Image(systemName: "bell.circle.fill")
                    Text("Announcements")
                }
                
                NavigationView{
                    CommitteeView()
                }
                .tabItem{
                    Image(systemName: "person.2.circle.fill")
                    Text("Committee")
                }
                
                NavigationView{
                    AboutView()
                }
                .tabItem{
                    Image(systemName: "questionmark.circle.fill")
                    Text("About")
                }
            }
        }
    }
}
