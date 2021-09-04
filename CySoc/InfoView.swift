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
        ScrollView{
        Text("Moving through London")
        Text("Subscriptions")
                .scaledToFit()
        }
            .navigationTitle(Text("Information"))
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
