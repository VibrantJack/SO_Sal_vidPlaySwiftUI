//
//  VideoDescription.swift
//  VideoPlayerSwiftUI
//
//  Created by Slice on 2023-10-24.
//

import SwiftUI

struct VideoDescription: View {
    var data : VideoData? = nil
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text(data?.title ?? "Unknown Title")
                    .font(.title)
                Text(data?.author.name ?? "Unknown Author")
                    .font(.subheadline)
                Spacer()
                Text(data?.description ?? "Unknown Description?")
            }
        }.padding()
    }
}

#Preview {
    VideoDescription(data: VideoData(id: "test", title: "title", hlsURL: "bla", fullURL: "bla", description: "Some Description Lorem Epsum Etc stuff stuff stuff\n hahha", publishedAt: "1994", author: AuthorData(id: "testAuthor", name: "Frank thingamajig")))
}
