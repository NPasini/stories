//
//  TestingUtils.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

#if DEBUG
extension Story {
    static var stub1: Story {
        Story(
            id: 1,
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
            userName: "Bulba",
            userImageUrl: "https://i.pravatar.cc/300?u=1"
        )!
    }
    
    static var stub3: Story {
        Story(
            id: 3,
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png",
            userName: "Char",
            userImageUrl: "https://i.pravatar.cc/300?u=3"
        )!
    }
    
    static var stub4: Story {
        Story(
            id: 4,
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
            userName: "Char",
            userImageUrl: "https://i.pravatar.cc/300?u=4"
        )!
    }
    
    static var stub7: Story {
        Story(
            id: 7,
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png",
            userName: "Squir",
            userImageUrl: "https://i.pravatar.cc/300?u=7"
        )!
    }
    
    static var stub150: Story {
        Story(
            id: 150,
            imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png",
            userName: "Bulba",
            userImageUrl: "https://i.pravatar.cc/300?u=20"
        )!
    }
}

struct StoriesRepositoryStub: StoriesRepositoryProtocol {
    func loadMoreStories() async -> [Story] {
        [Story.stub1, Story.stub4, Story.stub7, Story.stub150]
    }
}

struct StoryViewPersisterStub: LocalPersisterProtocol {
    let isViewed: Bool
    
    func addStory(_ story: Story) {}
    func removeStory(_ story: Story) {}
    func isStoryAdded(_ story: Story) -> Bool { isViewed }
}

struct FavouritesPersisterStub: LocalPersisterProtocol {
    let isFavourite: Bool
    
    func addStory(_ story: Story) {}
    func removeStory(_ story: Story) {}
    func isStoryAdded(_ story: Story) -> Bool { isFavourite }
}
#endif
