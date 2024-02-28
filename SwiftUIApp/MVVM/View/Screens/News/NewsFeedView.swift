//
//  NewsFeedView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct NewsFeedView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        Text("News Feed")
        
        List {
            ForEach($viewModel.newsData) { newsItem in
                NewsItem(newsItem: newsItem)
            }
        }
        .onAppear{
            Task {
                await viewModel.fetchNewsData()
            }
        }
        .conditionalProgressView(isLoading: viewModel.isLoading)
    }
}

#Preview {
    NewsFeedView()
}
