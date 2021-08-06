//
//  CommitteeView.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 23/07/2021.
//

import SwiftUI

struct CommitteeView: View {
    let committee: [Committee]
    
    init() {
        let url = Bundle.main.url(forResource: "committee", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        committee = try! JSONDecoder().decode([Committee].self, from: data)
    }
    
    var body: some View {
        List(committee) {committee in
            VStack{
                HStack{
                    Image(committee.pPhoto)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100.0, height: 100.0)
                        
                    VStack{
                        Text(committee.name)
                            .font(.title)
                            .multilineTextAlignment(.center)
                        Text(committee.position)
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                }
                    Text(committee.degree + ", Year " + String(committee.year))
                        .font(.callout)
                Text("Contact: " + committee.contact)
                    .font(.callout)
            }
        }
            
            
            
        .navigationTitle(Text("Committee"))
        }
    }

struct CommitteeView_Previews: PreviewProvider {
    static var previews: some View {
        CommitteeView()
    }
}
