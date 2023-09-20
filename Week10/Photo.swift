//
//  Photo.swift
//  Week10
//
//  Created by 서동운 on 9/19/23.
//

import Foundation

struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]?
}

struct PhotoResult: Codable {
    let id: String
    let created_at: String
    let urls: PhotoURL
    let likes: Int
}

struct PhotoURL: Codable {
    let full: String
    let thumb: String
}
