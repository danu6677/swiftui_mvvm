//
//  Config.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation
struct Config {
    fileprivate static let apiVersion = "v1"
    fileprivate static let baseURL = "https://www.cbc.ca/aggregate_api/"
        
    fileprivate static let newsItemsEndpoint = baseURL + apiVersion + "/items?lineupSlug=news"
        
        
        /// Generates the URL for paginated news items. Offset meaning the items u wanna skip and fetch
    static func paginatedNewsURL (nextPage:Int,pageSize:Int) -> String {
            return "\(newsItemsEndpoint)&page=\(nextPage)&pageSize=\(pageSize)"
    }
    
}
