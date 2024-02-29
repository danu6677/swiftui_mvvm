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
            ImageView(url: newsItem.images?.square_140 ?? "",width: 100,height: 100,isRounded: true)
                .padding(20)
            Text(newsItem.description?.isEmpty ?? true ? "Nothing here to showcase you know so please ignore this descryption" : newsItem.description ?? "")
                .padding(20)
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)//Use 90%
        .background(Color.white) // Card background color
        .cornerRadius(10) // Card corner radius
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5) // Add elevation with shadow
    }
    
}

#Preview {
    NewsItem(newsItem: .constant(NewsModel(id: 12, publishedAt: 0, title: "Local News", description: "So many news to display", source: "", type: "", images: ImageURL(square_140: "https://www.drawing123.com/wp-content/uploads/2021/10/pikachu-drawing-step-11.png"), imageData: nil,isRead: false)))
}
