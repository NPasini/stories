//
//  StoryCardView.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

struct StoryCardView: View {
    let story: Story
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .strokeBorder(story.isViewed ? Color.gray : Color.blue, lineWidth: 3)
                    .frame(width: 60, height: 60)
                
                AsyncImage(url: story.imageUrl) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                    } else if phase.error != nil {
                        Color.red
                    } else {
                        Color.gray.opacity(0.3)
                    }
                }
                .clipShape(Circle())
                .frame(width: 54, height: 54)
            }
            
            Text(story.userName)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 80)
    }
}

#Preview {
    VStack(spacing: 50) {
        StoryCardView(
            story: .init(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                isViewed: false,
                userName: "Bulba",
                userImageUrl: "https://i.pravatar.cc/300?u=1"
            )!
        )
        StoryCardView(
            story: .init(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
                isViewed: false,
                userName: "Char",
                userImageUrl: "https://i.pravatar.cc/300?u=11"
            )!
        )
    }
}
