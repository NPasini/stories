//
//  StoryCardView.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

struct StoryCardView: View {
    @StateObject private var viewModel: StoryCardViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .strokeBorder(viewModel.isViewed ? Color.gray : Color.blue, lineWidth: 3)
                    .frame(width: 60, height: 60)
                
                AsyncImage(url: viewModel.imageUrl) { phase in
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
            
            Text(viewModel.userName)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 80)
    }
    
    init(viewModel: StoryCardViewModel) {
        self._viewModel = StateObject(
            wrappedValue: viewModel
        )
    }
}

#Preview {
    VStack(spacing: 50) {
        StoryCardView(
            viewModel: StoryCardViewModel(
                story: Story(
                    imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                    userName: "Bulba",
                    userImageUrl: "https://i.pravatar.cc/300?u=1"
                )!,
                storyViewPersister: StoryViewPersisterStub(isViewed: true)
            )
        )
        StoryCardView(
            viewModel: StoryCardViewModel(
                story: Story(
                    imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
                    userName: "Char",
                    userImageUrl: "https://i.pravatar.cc/300?u=11"
                )!,
                storyViewPersister: StoryViewPersisterStub(isViewed: false)
            )
        )
    }
}
