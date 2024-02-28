//
//  File.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation
struct NewsModel:Codable,Identifiable {
    let id,publishedAt: Int?
    let title,description,source,type: String?
    let images:ImageURL?
    let imageData:Data?
}

struct ImageURL:Codable {
    let square_140: String?
}
