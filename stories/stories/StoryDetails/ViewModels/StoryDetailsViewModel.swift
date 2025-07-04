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
    private let storyViewPersister: StoryViewPersisterProtocol
    private let favouritesPersister: FavouritesPersisterProtocol
    
    var imageUrl: URL { story.imageUrl }
    var userName: String { story.userName }
    var userImageUrl: URL { story.userImageUrl }
    
    func toggleFavourite() {
        if isFavourite {
            favouritesPersister.unmarkStoryUrlAsFavourite(story: story)
        } else {
            favouritesPersister.markStoryUrlAsFavourite(story: story)
        }
        
        isFavourite = !isFavourite
    }
    
    func onAppear() {
        checkIsFavourite()
        storyViewPersister.markStoryAsViewed(story: story)
    }
    
    init(story: Story, storyViewPersister: StoryViewPersisterProtocol, favouritesPersister: FavouritesPersisterProtocol) {
        self.story = story
        self.storyViewPersister = storyViewPersister
        self.favouritesPersister = favouritesPersister
    }
}

private extension StoryDetailsViewModel {
    func checkIsFavourite() {
        isFavourite = favouritesPersister.isStoryUrlFavourite(story: story)
    }
}
