//
//  People.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 23/07/2021.
//
//video time = 1:28:59

import Foundation

struct Person: Decodable, Identifiable {
    let id: Int
    let name: String
    let degree: String
    let year: Int
    let available: Bool
    let contact: String
    let pPhoto: String
    
    static let example = Person(id: 1, name: "Giorgos Vyronos", degree: "Electronic and Information Engineering", year: 2, available: true, contact: "gv319@ic.ac.uk", pPhoto: "gvyronos1")
}
