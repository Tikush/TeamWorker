//
//  NewsResponse.swift
//  TeamWorker
//
//  Created by Tiko on 05.07.21.
//
import Foundation

struct ArticlesResponse: Codable {
    let articlesList: [Articles]
    
    enum CodingKeys: String, CodingKey {
        case articlesList = "articles"
    }
}
