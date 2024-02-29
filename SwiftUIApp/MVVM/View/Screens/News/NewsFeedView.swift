//
//  NewsFeedView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct NewsFeedView : View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var hasFetchedData = false
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("News Feed")
                    .font(.system(size: 30))
                List {
                   
                    ForEach($viewModel.newsData) { $newsItem in
                    
                        NavigationLink(value: newsItem) {
                            NewsItem(newsItem: $newsItem)
                                .padding(.vertical)
                        }
                        .listRowSeparator(.hidden)//Remove the row separator
                        .listRowBackground(Color.clear) // Set row background color to clear to disable selection highlight
                    }
                }
                .onAppear{
                   
                    if !hasFetchedData { // Check if data has already been fetched
                        Task {
                            await viewModel.fetchNewsData()
                            hasFetchedData = true // Update flag to indicate data has been fetched
                        }
                    }
                    
                }
    
                .listStyle(PlainListStyle())
                .conditionalProgressView(isLoading: viewModel.isLoading)
                .padding(.leading)
                //MARK: Network Error Handling
                .alert(item: $viewModel.errorMessage) { error in
                            Alert(
                                title: Text("Error"),
                                message: Text(error.errorMessage),
                                dismissButton: .default(Text("OK")) {
                                    // Reset the error when dismissed
                                    viewModel.errorMessage = nil
                                }
                            )
                 }
                //MARK: Navigation
                .navigationDestination(for: NewsModel.self) { newsItem in
                    let newsItemBinding = Binding(
                        get: {
                            viewModel.newsData.first(where: {$0.id == newsItem.id})!
                        },
                        set: { newItem in
                            let index =  viewModel.newsData.firstIndex(where: {$0.id == newsItem.id})!
                            viewModel.newsData[index] = newItem
                        }
                        
                    )
                   
                    DetailView(newsItem: newsItemBinding)
                }
            }
        }
    }
    
}

#Preview {
    NewsFeedView()
}
