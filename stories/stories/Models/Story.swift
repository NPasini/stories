//
//  Story.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

struct Story {
    let imageUrl: URL
    let userName: String
    let userImageUrl: URL
    
    init?(imageUrl: String, userName: String, userImageUrl: String) {
        guard let image = URL(string: imageUrl), let userImage = URL(string: userImageUrl) else { return nil }
        self.imageUrl = image
        self.userName = userName
        self.userImageUrl = userImage
    }
}
