//
//  TutoringView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 24/07/2021.
//

import SwiftUI
import Combine


struct Course: Decodable {
    let name, imageUrl: String
}



struct TutoringView: View {
    var body: some View {
            Text("hello")
                
                .navigationTitle(Text("Tutoring"))
        }
    }

struct TutoringView_Previews: PreviewProvider {
    static var previews: some View {
        TutoringView()
    }
}
