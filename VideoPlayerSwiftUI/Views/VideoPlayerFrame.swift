//
//  VideoPlayerFrame.swift
//  VideoPlayerSwiftUI
//
//  Created by Slice on 2023-10-24.
//

import SwiftUI
import _AVKit_SwiftUI

struct VideoPlayerFrame: View {
    var videoData : VideoData? = nil
    var onNext: (() -> Void)? = nil
    var onPrev: (() -> Void)? = nil
    var body: some View {
        ZStack{
            VideoPlayer(player: nil)
                .frame(minHeight: 200, maxHeight: 200)
            
            HStack{
                VideoButton(buttonImage: "previous",size: 50, onClick: triggerOnPrevious)
                VideoButton(buttonImage: "play",size:  70)
                VideoButton(buttonImage: "next",size:  50, onClick: triggerOnNext)
            }
        }
    }
    
    private func triggerOnNext() {
        onNext?()
    }
    private func triggerOnPrevious() {
        onPrev?()
    }
}

#Preview {
    VideoPlayerFrame()
}
