//
//  Navigation.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-12-29.
//

import SwiftUI
//MARK: only for the second tab
enum Screen: Hashable {
    case movies
    case movieDetail(movie: Movie)
    case modalContent
}

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var isModalPresented = false
    @Published var modalPath = NavigationPath()

    func push(to screen: Screen) {
        path.append(screen)
    }

    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func reset() {
        path = NavigationPath()
    }
    
    func presentModal() {
        isModalPresented = true
    }

    func dismissModal() {
        isModalPresented = false
        modalPath = NavigationPath()
    }
}
