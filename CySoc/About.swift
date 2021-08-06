//
//  About.swift
//  CySoc
//
//  Created by Giorgos Vyronos on 24/07/2021.
//

import Foundation

struct About: Decodable{
    let title: String
    let child: [About]?
    
}
