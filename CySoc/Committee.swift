//
//  Committee.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 23/07/2021.
//

import Foundation

struct Committee: Decodable, Identifiable {
    let id: Int
    let position: String
    let name: String
    let degree: String
    let year: Int
    let contact: String
    let pPhoto: String
}
