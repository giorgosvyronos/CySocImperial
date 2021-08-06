//
//  AboutView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 23/07/2021.
//

import SwiftUI

struct AboutView: View {
    let abouts: [About]
    
    init() {
        let url = Bundle.main.url(forResource: "abouts", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        abouts = try! JSONDecoder().decode([About].self, from: data)
    }
    
    var body: some View {
        List(abouts, id: \.title, children: \.child ){ about in
            if about.child !=  nil {
            Label(about.title, systemImage: "quote.bubble")
                .font(.headline)
            } else {
                Text(about.title)
            }
        }
            .navigationTitle(Text("About"))
    }
    
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
