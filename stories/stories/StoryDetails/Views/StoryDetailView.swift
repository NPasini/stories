//
//  StoryDetailView.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

struct StoryDetailView: View {
    let story: Story

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                AsyncImage(url: story.userImageUrl) { phase in
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
                .frame(width: 50, height: 50)
                .clipShape(Circle())

                Text(story.userName)
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding(.horizontal)
            
            AsyncImage(url: story.imageUrl) { phase in
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
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    StoryDetailView(
        story: Story(
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            isViewed: false,
            userName: "Bulba",
            userImageUrl: "https://i.pravatar.cc/300?u=1"
        )!
    )
}
