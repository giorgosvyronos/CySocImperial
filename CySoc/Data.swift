//
//  Data.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 06/08/2021.
//

import Foundation


struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String       // renamed latitute
    var date: String        // renamed longtitude
    var note: String
}
 
class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "http://192.168.10.13:8081/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
