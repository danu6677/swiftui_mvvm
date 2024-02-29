//
//  File.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation
//MARK: To be able to use the Navigation Links we need to conforms to hashable protocol
struct NewsModel:Hashable,Codable,Identifiable {
    let id,publishedAt: Int?
    let title,description,source,type: String?
    let images:ImageURL?
    let imageData:Data?
    var isRead:Bool?
}

struct ImageURL:Hashable,Codable {
    let square_140: String?
}
