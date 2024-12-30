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
            content
                .navigationDestination(for: Screen.self, destination: navigationDestination)
        }
        .sheet(isPresented: $coordinator.isModalPresented) {
            modalContent
        }
    }
    
    @ViewBuilder
    private var content: some View {
        VStack(alignment: .center, spacing: 10) {
            List {
                movieSection
                actionSection
            }
        }
    }
    
    @ViewBuilder
    private var movieSection: some View {
        Section(header: Text("Movies")) {
            ForEach(movies) { movie in
                NavigationLink(value: Screen.movieDetail(movie: movie)) {
                    HStack {
                        Image(systemName: "film")
                        Text(movie.title)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var actionSection: some View {
        Section(header: Text("Actions")) {
            Button("Open Modal") {
                coordinator.presentModal()
            }
        }
    }
    
    @ViewBuilder
    private func navigationDestination(for screen: Screen) -> some View {
        switch screen {
        case .movieDetail(let movie):
            MovieDetailView(movie: movie)
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var modalContent: some View {
        NavigationStack(path: $coordinator.modalPath) {
            ModalContentView()
                .navigationDestination(for: Screen.self, destination: modalNavigationDestination)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            coordinator.dismissModal()
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    private func modalNavigationDestination(for screen: Screen) -> some View {
        switch screen {
        case .modalContent:
            ModalDetailView()
        default:
            EmptyView()
        }
    }
}

#Preview {
    MoviesView()
        .environmentObject(NavigationCoordinator())
}
