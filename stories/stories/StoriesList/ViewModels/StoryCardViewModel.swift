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
    private let storyViewPersister: LocalPersisterProtocol
    
    var imageUrl: URL { story.imageUrl }
    var userName: String { story.userName }
    
    func onAppear() {
        isViewed = storyViewPersister.isStoryAdded(story)
    }
    
    init(story: Story, storyViewPersister: LocalPersisterProtocol) {
        self.story = story
        self.storyViewPersister = storyViewPersister
    }
}
