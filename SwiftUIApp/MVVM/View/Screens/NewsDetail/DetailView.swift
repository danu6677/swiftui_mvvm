//
//  DetailView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct DetailView: View {
    @Binding var newsItem: NewsModel
    //MARK: Acts as a binding to the isRead property of newsItem.
    var isRead: Binding<Bool> {
        Binding<Bool>(
            get: {newsItem.isRead ?? false},
            set: {newsItem.isRead = $0}
        )
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ImageView(
                    url: newsItem.images?.square_140 ?? "",
                    width: 300,
                    height: 300
                )
                .padding(
                    20
                )
                Text(
                    "Description"
                )
                .font(
                    .headline
                )
                .padding(
                    .vertical
                )
                Text(
                    newsItem.description ?? ""
                )
                .padding(
                    .horizontal
                )
                .font(
                    .subheadline
                )
                Spacer()
                Toggle(isOn:isRead,
                       label: {
                    Text(
                        "Content is sucessfully fully read"
                    )
                    
                })
                .padding(
                    EdgeInsets(
                        top: 20,
                        leading: 20,
                        bottom: 50,
                        trailing: 20
                    )
                )
                .font(
                    .headline
                )
            }
        }
    }
}

#Preview {
    DetailView(
        newsItem: .constant(
            NewsModel(
                id: 1,
                publishedAt: 1,
                title: "New Title",
                description: "Some descriptrion",
                source: "",
                type: "",
                images: nil,
                isRead: false
            )
        )
    )
}

