//
//  InfoView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 24/07/2021.
//

import SwiftUI

struct InfoView: View {
    @State var posts: [Post] = []
    
    var body: some View {
        List(posts){ post in
            VStack{
                Text(post.title).font(.headline)
                Text(post.date).font(.subheadline).italic()
            }
        }
        .onAppear {
            Api().getPosts { (posts) in
                self.posts = posts
            }
        }
        
            
            
            .navigationTitle(Text("Information"))
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
