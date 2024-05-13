//
//  MockService.swift
//  SwiftUIAppTests
//
//  Created by Danutha Fernando on 2024-05-12.
//

import Foundation

final class MockService : NewsServiceProtocol {
    func getNews() async throws -> [NewsModel] {
        let mockData: NewsModel = NewsModel(id: 1, publishedAt: 43, title: "some title", description: "none", source: "na", type: "na", images: ImageURL(square_140: "someurl"), imageData: nil)
        return [mockData]
    }
}
