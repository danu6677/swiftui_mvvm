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
    let width:CGFloat
    let height:CGFloat
    let isRounded:Bool
    
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .scaledToFill()
            .clipShape(
                isRounded ? AnyShape(Circle()) : AnyShape(Rectangle())
            ) // Apply circle shape to make it a full circle
            .frame(width: width, height: height)
    }
}

#Preview {
    ImageView(url: "https://www.drawing123.com/wp-content/uploads/2021/10/pikachu-drawing-step-11.png",width: 100,height: 100, isRounded: true)
}
