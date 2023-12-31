//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var videoListLoader = VideoListLoader()
    @State private var viewingIndex = 0;
    
    var body: some View {
        VStack{
            if let error = videoListLoader.error {
                Text(error.localizedDescription)
                    .padding(10)
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.red)
                    .foregroundColor(.white)
            } else if videoListLoader.isLoading {
                Text("Loading...")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(Color.clear)
            } else if videoListLoader.Videos.isEmpty {
                Text("No Videos")
            } else {
                VStack{
                    VideoPlayerFrame(onNext: OnNext, onPrev: OnPrevious, prevAvailable: viewingIndex > 0, nextAvailable: viewingIndex < videoListLoader.Videos.count - 1, videoData: videoListLoader.Videos[viewingIndex])
                    VideoDescription(data: videoListLoader.Videos[viewingIndex])
                }
            }
        }.onAppear(){
            Task{
                await videoListLoader.LoadData()
            }
        }
    }
    
    func OnPrevious(){
        viewingIndex = max(viewingIndex-1,0)
    }
    
    func OnNext(){
        viewingIndex = min(viewingIndex+1,videoListLoader.Videos.count - 1)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
