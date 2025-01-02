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
            HeaderView(title: movie.title, subtitle: movie.id)
            Button("Back to Home") {
                coordinator.reset()
            }.padding(.top, 150)
        }
        .padding()
    }
}


struct HeaderView: View {
    let title: String
    let subtitle: Int
    
    /* MARK: VStack Spacing is 40 in verticle direction. Frame is what what justify the content
     */
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            Text("Movie is \(title)")
                .font(.largeTitle)
            
            Text("For ID: \(subtitle)")
                .font(.body)
        }
        .padding(.leading, 50)
        .frame(maxWidth: .infinity, alignment: .leading) // Ensures alignment to leading
    }
}
#Preview {
    HeaderView(title: "Header", subtitle: 7)
}
