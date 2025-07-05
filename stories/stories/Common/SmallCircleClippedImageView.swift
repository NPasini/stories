//
//  SmallCircleClippedImageView.swift
//  stories
//
//  Created by nicolo.pasini on 05/07/25.
//

import SwiftUI

struct SmallCircleClippedImageView: View {
    private let imageUrl: URL

    var body: some View {
        AsyncImage(url: imageUrl) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Color.red
            default:
                Color.gray.opacity(0.3)
            }
        }
        .frame(width: 54, height: 54)
        .clipShape(Circle())
    }
    
    init(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
}
