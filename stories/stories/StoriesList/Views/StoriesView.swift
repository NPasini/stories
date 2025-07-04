//
//  StoriesView.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

struct StoriesView: View {
    private let storyViewPersister: StoryViewPersisterProtocol
    private let favouritesPersister: FavouritesPersisterProtocol
    
    @StateObject private var viewModel: StoriesViewModel

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(viewModel.stories.indices, id: \.self) { index in
                        NavigationLink(
                            destination: StoryDetailView(
                                viewModel: StoryDetailsViewModel(
                                    story: viewModel.stories[index],
                                    storyViewPersister: storyViewPersister,
                                    favouritesPersister: favouritesPersister
                                )
                            )
                        ) {
                            StoryCardView(
                                story: viewModel.stories[index]
                            ).onAppear {
                                if index == viewModel.stories.count - 1 {
                                    viewModel.loadMoreStories()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 120)
        }.task { viewModel.loadMoreStories() }
    }
    
    init(viewModel: StoriesViewModel, storyViewPersister: StoryViewPersisterProtocol, favouritesPersister: FavouritesPersisterProtocol) {
        self.storyViewPersister = storyViewPersister
        self.favouritesPersister = favouritesPersister
        self._viewModel = StateObject(
            wrappedValue: viewModel
        )
    }
}

#Preview {
    StoriesView(
        viewModel: StoriesViewModel(
            repository: StoriesRepositoryStub()
        ),
        storyViewPersister: StoryViewPersisterStub(isViewed: true),
        favouritesPersister: FavouritesPersisterStub(isFavourite: true)
    )
}
