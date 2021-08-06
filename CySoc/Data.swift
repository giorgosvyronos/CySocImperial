//
//  Data.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 06/08/2021.
//

import Foundation


struct Post: Codable, Identifiable {
    let id = UUID()
    var name: String       // renamed latitute
    var email: String        // renamed longtitude
}
 
class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}
