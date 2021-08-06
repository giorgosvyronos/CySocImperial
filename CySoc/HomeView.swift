//
//  HomeView.swift
//  CySoc
//  Imperial College London Cypriot Society App
//
//  Created by Giorgos Vyronos on 18/07/2021.
//  Copyright © 2021 Giorgos Vyronos. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack{
            HStack {
                    NavigationLink(destination: EventsView()){
                        VStack{
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                            Text("Events")
                        }
                    }

                    NavigationLink(destination: JobsView()){
                        VStack{
                            Image(systemName: "hammer.fill")
                                .resizable()
                                .scaledToFit()
                            Text("Employment")
                        }
                    }

                    NavigationLink(destination: FreshersView()){
                        VStack{
                            Image(systemName: "briefcase.fill")
                                .resizable()
                                .scaledToFit()
                            Text("Freshers")
                        }
                    }
            }
            
            HStack{
                    NavigationLink(destination: InfoView()){
                        VStack{
                            Image(systemName: "info.circle.fill")
                                .resizable()
                                .scaledToFit()
                            Text("Useful Info")
                                .multilineTextAlignment(.center)
                        }
                    }
                            
                    NavigationLink(destination: TutoringView()){
                        VStack{
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                            Text("Tutoring")
                        }
                    }
                
                    NavigationLink(destination: LocationsView()){
                        VStack{
                            Image(systemName: "bed.double.fill")
                                .resizable()
                                .scaledToFit()
                            Text("Dating")
                        }
                    }
                NavigationLink(destination: EmptyView()){
                    EmptyView()
                }
            }
            .navigationTitle(Text("CySoc"))
    }
        }
        .padding()
    }
    
}
struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
        
    }
}
