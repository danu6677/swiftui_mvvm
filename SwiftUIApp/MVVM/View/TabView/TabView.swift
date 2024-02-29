//
//  TabView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab:Tab = .news

        var body: some View {
            TabView(selection:$selectedTab){
                NewsFeedView()
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("News")
                    }
                    .tag(Tab.news)
                MoviesView()
                    .tabItem {
                        Image(systemName: "film")
                        Text("Movies")
                    }
                    .tag(Tab.movies)
            }
            .onChange(of: selectedTab) { oldState, newState in
                print("Selected Tab:",newState)
            }
        }
}

#Preview {
    TabBar()
}

enum Tab: Hashable {
    case news, movies
}
