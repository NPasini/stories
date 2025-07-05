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
                SmallCircleClippedImageView(imageUrl: viewModel.imageUrl)
            }
            Text(viewModel.userName)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 80)
        .onAppear(perform: viewModel.onAppear)
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
                story: Story.stub1,
                storyViewPersister: StoryViewPersisterStub(isViewed: true)
            )
        )
        StoryCardView(
            viewModel: StoryCardViewModel(
                story: Story.stub4,
                storyViewPersister: StoryViewPersisterStub(isViewed: false)
            )
        )
    }
}
