//
//  AlbumDataModel.swift
//  PracticeAlamofire
//
//  Created by 김태현 on 2023/01/12.
//

import Foundation

struct AlbumDataModel: Codable {
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
//    let mainImageURL: String
//    let thumbnailImageURL: String
//    let status: Int
//    let success: Bool
//    let message: String
//    let data: Album
}

struct Album: Codable {
    let id: Int
    let title: String
    let mainImageURL: String
    let thumbnailImageURL: String
}
