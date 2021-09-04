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

struct Event: Codable, Identifiable {
    let id = UUID()
    var title: String          // Title of event
    var datetime: String       // Date and time of event
    var location: String       // Location of event
    var text: String    // Description of event
    var link: String           // Link to Facebook event
}
 
class EventApi {
    func getEvents(completion: @escaping ([Event]) -> ()) {
        guard let url = URL(string: "http://192.168.10.90:8081/events/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let events = try! JSONDecoder().decode([Event].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(events)
            }
        }
        .resume()
    }
}

struct Announcement: Codable, Identifiable {
    let id = UUID()
    var title: String          // Title of announcement
    var datetime: String       // Date and time of annoucement
    var text: String    // Description of announcement
    var link: String           // Link to Facebook announcement
}
 
class AnnouncementApi {
    func getAnnouncements(completion: @escaping ([Announcement]) -> ()) {
        guard let url = URL(string: "http://192.168.10.13:8081/announcements/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let announcements = try! JSONDecoder().decode([Announcement].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(announcements)
            }
        }
        .resume()
    }
}

struct Job: Codable, Identifiable {
    let id = UUID()
    var title: String          // Title of Job
    var datetime: String       // Date and time of Job
    var text: String    // Description of Job
    var link: String           // Link to Facebook Job
}
 
class JobApi {
    func getJobs(completion: @escaping ([Job]) -> ()) {
        guard let url = URL(string: "http://192.168.10.13:8081/jobs/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let jobs = try! JSONDecoder().decode([Job].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(jobs)
            }
        }
        .resume()
    }
}

struct Housing: Codable, Identifiable {
    let id = UUID()
    var title: String          // Title of Housing
    var datetime: String       // Date and time of Housing
    var text: String    // Description of Housing
    var link: String           // Link to Housing
    var contact: String     // Contact of Housing
}
 
class HousingApi {
    func getHousings(completion: @escaping ([Housing]) -> ()) {
        guard let url = URL(string: "http://192.168.10.13:8081/housings/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let housings = try! JSONDecoder().decode([Housing].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(housings)
            }
        }
        .resume()
    }
}

struct Tutor: Codable, Identifiable {
    let id = UUID()
    var title: String          // Title of Tutor
    var datetime: String       // Date and time of Tutor
    var text: String    // Description of Tutor
    var available: String           // Availability of Tutor
    var contact: String        // Contact of Tutor
}
 
class TutorApi {
    func getTutors(completion: @escaping ([Tutor]) -> ()) {
        guard let url = URL(string: "http://192.168.10.13:8081/tutors/fetch") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let tutors = try! JSONDecoder().decode([Tutor].self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(tutors)
            }
        }
        .resume()
    }
}
