//
//  NewsFeedView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var searchedText = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 10){
                List {
                    ForEach($viewModel.newsData,id: \.self) { $newsItem in
                        
                        NavigationLink(value: newsItem) {
                            NewsItem(newsItem: $newsItem)
                                .padding(.vertical)
                        }
                        .listRowSeparator(.hidden)//Remove the row separator
                        .listRowBackground(Color.clear) // Set row background color to clear to disable selection highlight
                        
                    }
                }
                .onAppear{
                    Task {
                        await viewModel.fetchNewsData()
                    }
                }
                .navigationTitle("News Feed")
                .listStyle(PlainListStyle())
                .conditionalProgressView(isLoading: viewModel.isLoading)
                //Pull to refresh
                .refreshable {
                    print("Refresh Data........")
                }
                //Search bar
                .searchable(text: $searchedText, prompt: "Search News").onChange(of: searchedText, { oldValue, newValue in
                    print(newValue)
                })
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
                .background( Color(UIColor.systemGray5)
                    .edgesIgnoringSafeArea(.all))
                
            }
        }
    }
    
}

#Preview {
    NewsFeedView()
}
