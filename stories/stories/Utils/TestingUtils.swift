//
//  TestingUtils.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

#if DEBUG
struct StoriesRepositoryStub: StoriesRepositoryProtocol {
    func loadMoreStories() async -> [Story] {
        [
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                userName: "Bulba",
                userImageUrl: "https://i.pravatar.cc/300?u=1"
            )!,
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
                userName: "Char",
                userImageUrl: "https://i.pravatar.cc/300?u=4"
            )!,
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
                userName: "Squir",
                userImageUrl: "https://i.pravatar.cc/300?u=7"
            )!,
            Story(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
                userName: "Bulba",
                userImageUrl: "https://i.pravatar.cc/300?u=20"
            )!
        ]
    }
}

struct StoryViewPersisterStub: StoryViewPersisterProtocol {
    let isViewed: Bool
    
    func markStoryAsViewed(story: Story) {}
    func isStoryViewed(story: Story) -> Bool { isViewed }
}

struct FavouritesPersisterStub: FavouritesPersisterProtocol {
    let isFavourite: Bool
    
    func markStoryUrlAsFavourite(story: Story) {}
    func unmarkStoryUrlAsFavourite(story: Story) {}
    func isStoryUrlFavourite(story: Story) -> Bool { isFavourite }
}
#endif
