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
        ImageView(url: newsItem.images?.square_140 ?? "",width: 300,height: 300, isRounded: false)
            .padding(20)
        Text("Description")
            .font(.headline)
            .padding(.vertical)
        Text(newsItem.description ?? "")
            .padding(.horizontal)
            .font(.subheadline)
    }
}

#Preview {
    DetailView(newsItem: .constant(NewsModel(id: 1, publishedAt: 1, title: "New Title", description: "Some descriptrion", source: "", type: "", images: nil, imageData: nil, isRead: false)))
}
