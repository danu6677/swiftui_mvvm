//
//  ImageView.swift
//  SwiftUIApp
//
//  Created by Danutha Fernando on 2024-02-28.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    var url: String
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .scaledToFill()
            .clipShape(Circle()) // Apply circle shape to make it a full circle
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ImageView(url: "https://www.drawing123.com/wp-content/uploads/2021/10/pikachu-drawing-step-11.png")
}
