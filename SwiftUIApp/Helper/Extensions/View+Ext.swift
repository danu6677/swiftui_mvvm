//
//  View+Ext.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI
//ProgressView
extension View {
    func conditionalProgressView(isLoading: Bool) -> some View {
        if isLoading {
            return AnyView(
                self
                    .blur(radius: 3) // Add blur effect
                    .overlay(
                        CustomProgressView()
                    )
                    .disabled(true) // Disable user interaction
            )
        } else {
            return AnyView(self)
        }
    }
    
    func showSpinner(isLoading:Bool) -> some View {
        if isLoading {
            return AnyView(
                self .blur(radius: 3)
                    .overlay(
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(3)
                    )
                    .disabled(true)
            )
        }else {
            return AnyView(self)
        }
    }
}

