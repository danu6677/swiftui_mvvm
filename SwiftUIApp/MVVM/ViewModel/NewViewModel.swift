//
//  NewViewModel.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import Foundation
class NewsViewModel:ObservableObject {

    @Published private (set) var isLoading = true
    @Published var newsData: [NewsModel] = []
    @Published var errorMessage: ErrorWrapper? = nil
    private var service:NewsServiceProtocol
    
    init(service: NewsServiceProtocol = NewsService()) {
        self.service = service
    }
    /*After the getNews() operation completes, Swift resumes execution of the fetchNewsData() function. Since fetchNewsData() is marked with @MainActor, any subsequent updates to UI-related properties (newsData, errorMessage, isLoading) will occur on the main thread.
     */
    @MainActor
    func fetchNewsData() async {
        if isLoading {
          do {
                let fetchedNewsData = try await service.getNews()
                self.newsData = fetchedNewsData
                self.isLoading = false
           } catch {
                print(error.localizedDescription)
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
