//
//  VideoButton.swift
//  VideoPlayerSwiftUI
//
//  Created by Slice on 2023-10-24.
//

import SwiftUI

struct VideoButton: View {
    var buttonImage: String
    var size: CGFloat = 50
    var onClick: (() -> Void)? = nil
    let color: Color = .white
    var body: some View {
        Button(){
            onClick?()
        } label: {
            ZStack{
                Circle().fill(color).shadow(radius: 10)
                    .frame(width: size, height: size)
                Image(buttonImage)
                    .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    VideoButton(buttonImage: "play", size:75)
}
