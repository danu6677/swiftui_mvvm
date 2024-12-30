//
//  ModalViews.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-12-30.
//
import SwiftUI

struct ModalView: View {
    @EnvironmentObject var coordinator: NavigationCoordinator
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Text("Modal View")
            Button("Go to Modal Content") {
                coordinator.modalPath.append(Screen.modalContent)
            }
            Button("Pop To main tab") {
                coordinator.dismissModal()
            }
        }
        
    }
}
#Preview {
    ModalView()
        .environmentObject(NavigationCoordinator())
}

struct ModalDetailView: View {
    var body: some View {
        VStack{
            Text("Modal Detail Content")
        }
    }
}
