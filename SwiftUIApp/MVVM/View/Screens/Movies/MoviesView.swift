//
//  MoviesView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    let movies = [
        Movie(id: 1, title: "Inception"),
        Movie(id: 2, title: "Interstellar"),
        Movie(id: 3, title: "The Dark Knight")
    ]
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack(alignment: .center, spacing: 20) {
                List(movies, id: \.id) { movie in
                    NavigationLink(value: Screen.movieDetail(movie: movie)) {
                        HStack {
                            Image(systemName: "film")
                            Text(movie.title)
                        }
                    }
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .movieDetail(let movie):
                    MovieDetailView(movie: movie)
                        //.environmentObject(coordinator)
                default:
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    MoviesView()
        .environmentObject(NavigationCoordinator())
    
}

struct Movie: Identifiable, Hashable {
    let id: Int
    let title: String
}
