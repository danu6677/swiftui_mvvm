//
//  CustomProgressBar.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI

struct CustomProgressView: View {
    @State private var isAnimating = false
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing),
                    style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)
                )
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(isAnimating ? 270 : -90))
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(), value: isAnimating)
            Circle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .frame(width: 20, height: 20)
                .offset(y: -50)
                .scaleEffect(isAnimating ? 1.0 : 0.5)
                .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    CustomProgressView()
}
