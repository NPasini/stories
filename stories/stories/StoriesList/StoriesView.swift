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

struct StoryCardView: View {
    let story: Story

    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 60, height: 60)
                .overlay(Text(story.userName.prefix(2))
                            .font(.headline)
                            .foregroundColor(.white))
            Text(story.userName)
                .font(.caption)
        }
        .frame(width: 80)
    }
}
