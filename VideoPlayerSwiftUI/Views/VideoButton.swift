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
    var interactable: Bool = true
    var onClick: (() -> Void)? = nil
    let color: Color = .white
    let uninteractableColor: Color = .gray
    var body: some View {
        if interactable{
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
        else
        {
            ZStack{
                Circle().fill(uninteractableColor).shadow(radius: 10)
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
