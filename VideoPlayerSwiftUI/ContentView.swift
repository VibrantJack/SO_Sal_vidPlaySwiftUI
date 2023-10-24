//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct ContentView: View {
    @State private var videos = [VideoData]()
    @State private var viewingIndex = 0;
    var body: some View {
        VStack{
            VideoPlayerFrame()
            VideoDescription()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
