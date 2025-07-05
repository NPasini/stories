//
//  StoryDetailView.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import SwiftUI

struct StoryDetailView: View {
    @StateObject private var viewModel: StoryDetailsViewModel

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                SmallCircleClippedImageView(imageUrl: viewModel.userImageUrl)
                Text(viewModel.userName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                favouriteButton
            }
            .padding(.horizontal)
            StoryImageView(imageUrl: viewModel.imageUrl)
            Spacer()
        }
        .padding()
        .onAppear(perform: viewModel.onAppear)
    }
    
    private var favouriteButton: some View {
        Button {
            viewModel.toggleFavourite()
        } label: {
            Image(systemName: viewModel.isFavourite ? "star.fill" : "star")
                .foregroundColor(viewModel.isFavourite ? .yellow : .gray)
                .imageScale(.large)
        }
        .buttonStyle(.plain)
    }
    
    init(viewModel: StoryDetailsViewModel) {
        self._viewModel = StateObject(
            wrappedValue: viewModel
        )
    }
}

#Preview {
    VStack(spacing: 50) {
        StoryDetailView(
            viewModel: StoryDetailsViewModel(
                story: Story.stub1,
                storyViewPersister: StoryViewPersisterStub(isViewed: true),
                favouritesPersister: FavouritesPersisterStub(isFavourite: true)
            )
        )
        StoryDetailView(
            viewModel: StoryDetailsViewModel(
                story: Story.stub1,
                storyViewPersister: StoryViewPersisterStub(isViewed: false),
                favouritesPersister: FavouritesPersisterStub(isFavourite: false)
            )
        )
    }
}
