//
//  DataFetcher.swift
//  VideoPlayerSwiftUI
//
//  Created by Slice on 2023-10-24.
//

import Foundation

@MainActor
final class VideoListLoader : ObservableObject{    
    private let remoteUrl = URL(string: "http://localhost:4000/videos")!

    @Published var isLoading: Bool = true
    @Published var error: Error?
    @Published var Videos: [VideoData] = []
    
    func LoadData() async {
        error = nil
        isLoading = true
        
        // Start by fetching our data
        do {
            let (data, _) = try await URLSession.shared.data(from: remoteUrl)
            Videos = try JSONDecoder().decode([VideoData].self, from: data)
        } catch {
            self.error = error
        }
        
        // Order our data by date!
        Videos = Videos.sorted(by: {$0.getPublishedDate() ?? Date.distantPast > $1.getPublishedDate() ?? Date.distantPast})
        
        
        isLoading = false
    }
    
}
