//
//  NewsItem.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct NewsItem: View {
    @Binding var newsItem:NewsModel
    var body: some View {
        VStack{
            ImageView(url: newsItem.images?.square_140 ?? "")
                .padding(.leading)
            Text(newsItem.description?.isEmpty ?? true ? "Nothing here to showcase you know so please ignore this descryption" : newsItem.description ?? "")
            
        }
    }
}

#Preview {
    NewsItem(newsItem: .constant(NewsModel(id: 12, publishedAt: 0, title: "Local News", description: "So many news to display", source: "", type: "", images: ImageURL(square_140: "https://www.drawing123.com/wp-content/uploads/2021/10/pikachu-drawing-step-11.png"), imageData: nil)))
}
