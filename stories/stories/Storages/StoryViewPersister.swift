//
//  StoryViewPersister.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

protocol StoryViewPersisterProtocol {
    func markStoryAsViewed(story: Story)
    func isStoryViewed(story: Story) -> Bool
}

struct StoryViewPersister: StoryViewPersisterProtocol {
    private static let keyPrefix = "view_story_"
    
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    private let storage: UserDefaults
    
    func isStoryViewed(story: Story) -> Bool {
        getViewedStoryUrls().contains { $0 == story.imageUrl }
    }
    
    func markStoryAsViewed(story: Story) {
        var urls = getViewedStoryUrls()
        urls.append(story.imageUrl)
        if let data = try? encoder.encode(urls) {
            storage.set(data, forKey: key(forPid: story.imageUrl.absoluteString))
        }
    }
    
    init(userDefaultsSuite: UserDefaults) {
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        storage = userDefaultsSuite
    }
}

private extension StoryViewPersister {
    func getViewedStoryUrls() -> [URL] {
        storage.dictionaryRepresentation()
            .filter { $0.key.hasPrefix(Self.keyPrefix) }
            .compactMap { $0.value as? Data }
            .compactMap { try? decoder.decode(URL.self, from: $0) }
    }
    
    func key(forPid pid: String) -> String {
        Self.keyPrefix + pid
    }
}
