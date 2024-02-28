//
//  NewsServiceProtocol.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation

protocol NewsServiceProtocol {
    func getNews() async throws -> [NewsModel]
}
