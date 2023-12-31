//
//  VideoData.swift
//  VideoPlayerSwiftUI
//
//  Created by Slice on 2023-10-24.
//

import Foundation
import SwiftUI

struct AuthorData : Hashable, Codable, Identifiable {
    var id : String = ""
    var name : String = ""
}

struct VideoData : Hashable, Codable, Identifiable {
    var id :String = ""
    var title :String = ""
    var hlsURL : String = ""
    var fullURL : String = ""
    var description : String = ""
    var publishedAt : String = ""
    var author : AuthorData = AuthorData()
    
    func getPublishedDate() -> Date? {
        return ISO8601DateFormatter().date(from: publishedAt)
    }
    
    func getLocalizedDescription() -> LocalizedStringKey {
        return LocalizedStringKey(description)
    }
}
