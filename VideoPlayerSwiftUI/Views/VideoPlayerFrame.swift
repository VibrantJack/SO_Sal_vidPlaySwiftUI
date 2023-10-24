//
//  VideoPlayerFrame.swift
//  VideoPlayerSwiftUI
//
//  Created by Slice on 2023-10-24.
//

import SwiftUI
import _AVKit_SwiftUI

struct VideoPlayerFrame: View {
    var onNext: (() -> Void)? = nil
    var onPrev: (() -> Void)? = nil
    var prevAvailable : Bool = true
    var nextAvailable : Bool = true
    
    @State var videoData = VideoData()
    @State private var player = AVPlayer()
    @State private var isPlaying = false
    
    var body: some View {
        ZStack{
            VideoPlayer(player: player)
                .frame(minHeight: 200, maxHeight: 200)
                .onAppear(){
                    resetPlayer()
                }
            
            HStack{
                VideoButton(buttonImage: "previous",size: 50, interactable:prevAvailable, onClick: triggerOnPrevious)
                if(isPlaying){
                    VideoButton(buttonImage: "pause",size:  80, onClick: toggleVideo)
                }else{
                    VideoButton(buttonImage: "play",size:  80, onClick: toggleVideo)
                }
                VideoButton(buttonImage: "next",size:  50, interactable: nextAvailable, onClick: triggerOnNext)
            }
        }
    }
    
    private func resetPlayer(){
        guard let url = URL(string: videoData.hlsURL) else {
            self.player.pause()
            return
        }
        print(url)
        let player = AVPlayer(url: url)
        self.player = player
        self.player.seek(to: CMTime.zero)
        self.player.pause()
    }
    
    private func triggerOnNext() {
        onNext?()
        resetPlayer()
    }
    private func triggerOnPrevious() {
        onPrev?()
        resetPlayer()
    }
    private func toggleVideo(){
        isPlaying.toggle()
        if(isPlaying){
            player.play()
        }else{
            player.pause()
        }
    }
}

#Preview {
    VideoPlayerFrame()
}
