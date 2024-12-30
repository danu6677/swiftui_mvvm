//
//  Navigation.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-12-29.
//

import SwiftUI

enum Screen: Hashable {
    case movies
    case movieDetail(movie: Movie)
}

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func push<T: Hashable>(to screen: T) {
        path.append(screen)
    }

    func pop() {
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }
}
