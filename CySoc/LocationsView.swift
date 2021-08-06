//
//  LocationsView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 24/07/2021.
//

import SwiftUI

struct LocationsView: View {
    var body: some View {
        Image("thalis")
            .resizable()
            .scaledToFit()
            
            .navigationTitle("Places")
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
