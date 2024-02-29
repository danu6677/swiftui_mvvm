//
//  NewViewModel.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation
class NewsViewModel:ObservableObject {
    @Published var isLoading = false
    @Published var newsData: [NewsModel] = []
    @Published var errorMessage: ErrorWrapper? = nil
    private var service:NewsServiceProtocol
    
    init(service: NewsServiceProtocol = NewsService()) {
        self.service = service
    }
    
    
    
    func fetchNewsData() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        do {
            let fetchedNewsData = try await service.getNews()
            DispatchQueue.main.async {
                self.newsData = fetchedNewsData
                self.isLoading = false
            }
        } catch {
            print(
                error.localizedDescription
            )
            DispatchQueue.main.async {
                self.errorMessage = ErrorWrapper(
                    errorMessage: error.localizedDescription
                )
                self.isLoading = false
            }
        }
    }
    
}



struct ErrorWrapper: Identifiable {
    let id = UUID()
    let errorMessage: String
}
