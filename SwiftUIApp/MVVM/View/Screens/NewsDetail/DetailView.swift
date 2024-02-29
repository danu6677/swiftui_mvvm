//
//  DetailView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct DetailView: View {
    @Binding var newsItem: NewsModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailView(newsItem: .constant(NewsModel(id: 1, publishedAt: 1, title: "New Title", description: "Some descryptrion", source: "", type: "", images: nil, imageData: nil, isRead: false)))
}
