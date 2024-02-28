//
//  Network.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class Network {
    
    ///Singleton
    private static var networkCalls: Network?
    private init() {}

    public static var shared: Network {

        if networkCalls == nil {
            networkCalls = Network()
        }
        return networkCalls!

    }
    
    func request<T: Decodable>(url: URL, method: HTTPMethod = .get, body: Data? = nil, headers: [String: String] = [:]) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        for (headerField, value) in headers {
            request.setValue(value, forHTTPHeaderField: headerField)
        }
        
        let session = URLSession.shared
        let (data, _) = try await session.data(for: request)
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

}
