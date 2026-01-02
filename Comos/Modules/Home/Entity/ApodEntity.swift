//
//  ApodEntity.swift
//  Comos
//
//  Created by Rodrigo Cerqueira Reis on 17/12/25.
//

import Foundation

struct ApodEntity: Codable {
    let title: String
    let explanation: String
    let date: String
    let url: String
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case explanation
        case date
        case url
        case mediaType = "media_type"
    }
}
