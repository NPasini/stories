//
//  StoriesView.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

struct StoriesScrollView: View {
    @StateObject private var viewModel: StoriesViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                ForEach(viewModel.stories.indices, id: \.self) { index in
                    StoryCardView(story: viewModel.stories[index])
                        .onAppear {
                            if index == viewModel.stories.count - 1 {
                                viewModel.loadMoreStories()
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 120)
        .task { viewModel.loadMoreStories() }
    }
    
    init(viewModel: StoriesViewModel) {
        self._viewModel = StateObject(
            wrappedValue: viewModel
        )
    }
}

#Preview {
    StoriesScrollView(
        viewModel: StoriesViewModel(
            repository: StoriesRepositoryStub()
        )
    )
}

#if DEBUG
struct StoriesRepositoryStub: StoriesRepositoryProtocol {
    func loadMoreStories() async -> [Story] {
        [
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                isViewed: false,
                userName: "Bulba",
                userImageUrl: "https://i.pravatar.cc/300?u=1"
            )!,
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
                isViewed: false,
                userName: "Char",
                userImageUrl: "https://i.pravatar.cc/300?u=4"
            )!,
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
                isViewed: false,
                userName: "Squir",
                userImageUrl: "https://i.pravatar.cc/300?u=7"
            )!,
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
                isViewed: false,
                userName: "Bulba",
                userImageUrl: "https://i.pravatar.cc/300?u=20"
            )!
        ]
    }
}
#endif
