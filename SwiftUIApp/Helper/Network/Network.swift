//
//  Network.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation


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
    
    func request<T: Codable>(url: URL, method: HTTPMethod = .get, body: Data? = nil, headers: [String: String] = [:]) async throws -> T {
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
/*MARK:  There are two ways to handle a request
 1. using do catch blocks
 
 do {
     let responseData: ResponseData = try await request(url: url, method: .post, body: body, headers: headers)
     print("Response data: \(responseData)")
 } catch {
     print("Error making POST request: \(error.localizedDesciption)")
 }
 
 
 2. using promises
 let result: Result<ResponseData, Error> = try await Result {
     return try await request(url: url, method: .post, body: body, headers: headers)
 }
 // Handle the result
 switch result {
 case .success(let responseData):
     print("POST request successful. Response data: \(responseData)")
 case .failure(let error):
     print("POST request failed with error: \(error)")
 }

 */
