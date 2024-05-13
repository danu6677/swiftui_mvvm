//
//  NewsItem.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsItem: View {
    @Binding var newsItem:NewsModel
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Circle()
                    .frame(width: 20,height: 20)
                    .foregroundColor( newsItem.isRead ?? false ? .green : .red)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
            }
                
            ImageVw(url: newsItem.images?.square_140 ?? "",isRounded: true)
                .padding(20)
            Text(newsItem.description?.isEmpty ?? true ? "Nothing here to showcase you know so please ignore this descryption" : newsItem.description ?? "")
                .padding(20)
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)//Use 90%
        .background(Color.white) // Card background color
        .cornerRadius(10) // Card corner radius
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5) // Add elevation with shadow
    }
    private func ImageVw(url:String,width:CGFloat = 100, height:CGFloat = 100, isRounded:Bool = true) -> some View {
        
       return WebImage(url: URL(string: url))
            .resizable()
            .scaledToFill()
            .clipShape(
                isRounded ? AnyShape(Circle()) : AnyShape(Rectangle())
            ) // Apply circle shape to make it a full circle
            .frame(width: width, height: height)
    }
}

#Preview {
    NewsItem(newsItem: .constant(NewsModel(id: 12, publishedAt: 0, title: "Local News", description: "So many news to display", source: "", type: "", images: ImageURL(square_140: "https://www.drawing123.com/wp-content/uploads/2021/10/pikachu-drawing-step-11.png"), imageData: nil,isRead: false)))
}
