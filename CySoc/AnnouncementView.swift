//
//  AnnouncementView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 23/07/2021.
//

import SwiftUI

struct AnnouncementView: View {
    @State var announcements: [Announcement] = []
    var body: some View {
        ZStack{
                List(announcements){ announcement in
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(announcement.title)
                                        .font(.system(size: 20.0, weight: .bold, design: .rounded))
                                        
                                HStack(alignment: .center) {
                                    Image(systemName: "link")
                                    Text(announcement.link)
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
                                    .foregroundColor(.green)
                                Text(announcement.datetime)
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(Color(.blue))
                                Text(announcement.text)
                                    .font(.system(size: 16.0, weight: .medium, design: .rounded))
                                    .foregroundColor(Color(.black))
                            }
                            Spacer()
//                            VStack {
//                                Image(systemName: "location")
//                                Text(event.location)
//                            }
//                            .font(.system(size: 16.0, weight: .medium, design: .rounded))
                        }
                        .padding(.bottom, 10.0)
                    }
                    .padding(.horizontal, 10)
                    .padding(.horizontal, 5)
                    .background(Color(UIColor.black.withAlphaComponent(0.1)))
                    .cornerRadius(15.0)
                    .shadow(color: Color(UIColor.black.withAlphaComponent(0.3)), radius: 40, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
                }
                
                .onAppear {
                    AnnouncementApi().getAnnouncements { (announcements) in
                        self.announcements = announcements
                    }
                }
                
                
            }
        
        
            .navigationTitle(Text("Announcements"))
    }
}

struct AnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AnnouncementView()
    }
}
