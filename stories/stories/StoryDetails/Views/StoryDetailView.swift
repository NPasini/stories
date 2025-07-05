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
                AsyncImage(url: viewModel.userImageUrl) { phase in
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

                Text(viewModel.userName)
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()
                
                Button {
                    viewModel.toggleFavourite()
                } label: {
                    Image(systemName: viewModel.isFavourite ? "star.fill" : "star")
                        .foregroundColor(viewModel.isFavourite ? .yellow : .gray)
                        .imageScale(.large)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal)
            
            AsyncImage(url: viewModel.imageUrl) { phase in
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
        .onAppear(perform: viewModel.onAppear)
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
