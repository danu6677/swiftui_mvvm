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
            List {
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
                
                Section(header: Text("Actions")) {
                    Button("Open Modal") {
                        coordinator.presentModal()
                    }
                }
            }
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .movieDetail(let movie):
                    MovieDetailView(movie: movie)
                default:
                    EmptyView()
                }
            }
        }
        .sheet(isPresented: $coordinator.isModalPresented) {
            NavigationStack(path: $coordinator.modalPath) {
                ModalContentView()
                    .navigationDestination(for: Screen.self) { screen in
                        switch screen {
                        case .modalContent:
                            ModalDetailView()
                        default:
                            EmptyView()
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                coordinator.dismissModal()
                            }
                        }
                    }
            }
        }
    }
}


#Preview {
    MoviesView()
        .environmentObject(NavigationCoordinator())
}


