//
//  Story.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

class Story {
    let imageUrl: URL
    var isViewed: Bool
    let userName: String
    let userImageUrl: URL
    
    init?(imageUrl: String, isViewed: Bool, userName: String, userImageUrl: String) {
        guard let image = URL(string: imageUrl), let userImage = URL(string: userImageUrl) else { return nil }
        self.imageUrl = image
        self.isViewed = isViewed
        self.userName = userName
        self.userImageUrl = userImage
    }
}
