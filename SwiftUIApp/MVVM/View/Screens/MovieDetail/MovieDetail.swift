//
//  MovieDetail.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-12-29.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack {
            Text("Detail Screen: \(movie.title)")
                .font(.title)
            Text("For ID: \(movie.id)")
                .font(.title)
            Button("Back to Home") {
                coordinator.reset()
            }
        }
        .padding()
    }
}
