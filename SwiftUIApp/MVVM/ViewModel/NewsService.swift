//
//  NewsService.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation
final class NewsService:NewsServiceProtocol {
    
    func getNews() async throws -> [NewsModel] {
        guard let url = URL(string: Config.paginatedNewsURL(nextPage: 2, pageSize: 10, offset: 0)) else { throw NetworkError.invalidURL }
        return try await Network.shared.request(url: url)
    }
    
}
