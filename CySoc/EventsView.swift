//
//  EventsView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 24/07/2021.
//

import SwiftUI

struct EventsView: View {
    @State var posts: [Post] = []
    var body: some View {
        ZStack{
                List(posts){ post in
                    //CardView()
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(post.name)
                                        .font(.system(size: 20.0, weight: .bold, design: .rounded))
            //                            .foregroundColor(Color(.black))
                                HStack(alignment: .center) {
                                    Image(systemName: "link")
                                    Text("Category")
                                }
                                .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 35.0, height: 35.0)
                        }
                        .padding(.top, 10.0)
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Status")
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(.green)    //.foregroundColor(post.statusAvailable ? Color(.failure) : .green)
                                Text(post.email)
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                    //                .foregroundColor(Color(.black))
                            }
                            Spacer()
                            VStack {
                                Image(systemName: "location")
                                Text("20km")
                            }
                            .font(.system(size: 16.0, weight: .medium, design: .rounded))
                        }
                        .padding(.bottom, 10.0)
                    }
                    .padding(.horizontal, 10)
                    .padding(.horizontal, 5)
                    .background(Color.secondary)
                    .cornerRadius(15.0)
                    .shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 15, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
                }
                .onAppear {
                    Api().getPosts { (posts) in
                        self.posts = posts
                    }
                }
                
                
                
            }
        //}
            .navigationTitle(Text("Events"))
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
    }
}


struct CardView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                        Text("Event Name")
                            .font(.system(size: 20.0, weight: .bold, design: .rounded))
//                            .foregroundColor(Color(.black))
                    HStack(alignment: .center) {
                        Image(systemName: "link")
                        Text("Category")
                    }
                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                    .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 35.0, height: 35.0)
            }
            .padding(.top, 10.0)
            HStack {
                VStack(alignment: .leading) {
                    Text("Status")
                        .font(.system(size: 16.0, weight: .medium, design: .rounded))
                        .foregroundColor(.green)    //.foregroundColor(post.statusAvailable ? Color(.failure) : .green)
                    Text("Location")
                        .font(.system(size: 16.0, weight: .medium, design: .rounded))
        //                .foregroundColor(Color(.black))
                }
                Spacer()
                VStack {
                    Image(systemName: "location")
                    Text("20km")
                }
                .font(.system(size: 16.0, weight: .medium, design: .rounded))
            }
            .padding(.bottom, 10.0)
        }
        .padding(.horizontal, 10)
        .padding(.horizontal, 5)
        .background(Color.secondary)
        .cornerRadius(15.0)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.5)), radius: 15, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
    }
}
