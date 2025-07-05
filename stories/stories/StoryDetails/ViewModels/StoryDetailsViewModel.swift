//
//  StoryDetailsViewModel.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

class StoryDetailsViewModel: ObservableObject {
    @Published var isFavourite: Bool = false
    
    private let story: Story
    private let storyViewPersister: LocalPersisterProtocol
    private let favouritesPersister: LocalPersisterProtocol
    
    var imageUrl: URL { story.imageUrl }
    var userName: String { story.userName }
    var userImageUrl: URL { story.userImageUrl }
    
    func toggleFavourite() {
        if isFavourite {
            favouritesPersister.removeStory(story)
        } else {
            favouritesPersister.addStory(story)
        }
        
        isFavourite = !isFavourite
    }
    
    func onAppear() {
        checkIsFavourite()
        storyViewPersister.addStory(story)
    }
    
    init(story: Story, storyViewPersister: LocalPersisterProtocol, favouritesPersister: LocalPersisterProtocol) {
        self.story = story
        self.storyViewPersister = storyViewPersister
        self.favouritesPersister = favouritesPersister
    }
}

private extension StoryDetailsViewModel {
    func checkIsFavourite() {
        isFavourite = favouritesPersister.isStoryAdded(story)
    }
}
