//
//  StoryImageView.swift
//  stories
//
//  Created by nicolo.pasini on 05/07/25.
//

import SwiftUI

struct StoryImageView: View {
    private let imageUrl: URL
    
    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 400)
                    .cornerRadius(16)
            case .failure:
                Color.red.frame(height: 300)
            default:
                Color.gray.opacity(0.3).frame(height: 300)
            }
        }
    }
    
    init(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
}
