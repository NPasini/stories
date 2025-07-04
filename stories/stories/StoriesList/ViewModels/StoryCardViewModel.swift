//
//  StoryCardViewModel.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//


import Foundation

class StoryCardViewModel: ObservableObject {
    @Published var isViewed = false
    
    private let story: Story
    private let storyViewPersister: StoryViewPersisterProtocol
    
    var imageUrl: URL { story.imageUrl }
    var userName: String { story.userName }
    
    func onAppear() {
        isViewed = storyViewPersister.isStoryViewed(story: story)
    }
    
    init(story: Story, storyViewPersister: StoryViewPersisterProtocol) {
        self.story = story
        self.storyViewPersister = storyViewPersister
    }
}
