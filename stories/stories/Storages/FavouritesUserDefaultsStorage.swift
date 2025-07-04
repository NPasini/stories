//
//  Untitled.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

protocol FavouritesPersisterProtocol {
    func markStoryUrlAsFavourite(story: Story)
    func unmarkStoryUrlAsFavourite(story: Story)
    func isStoryUrlFavourite(story: Story) -> Bool
}

struct FavouritesUserDefaultsStorage: FavouritesPersisterProtocol {
    private static let keyPrefix = "fav_story_"
    
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    private let storage: UserDefaults
    
    func isStoryUrlFavourite(story: Story) -> Bool {
        getFavouriteStoryUrls().contains { $0.url == story.imageUrl }
    }
    
    func markStoryUrlAsFavourite(story: Story) {
        var urls = getFavouriteStoryUrls()
        urls.append(StorableStory(url: story.imageUrl))
        if let data = try? encoder.encode(urls) {
            storage.set(data, forKey: key(forPid: story.imageUrl.absoluteString))
        }
    }
    
    func unmarkStoryUrlAsFavourite(story: Story) {
        var urls = getFavouriteStoryUrls()
        urls.removeAll { $0.url == story.imageUrl }
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

private extension FavouritesUserDefaultsStorage {
    func getFavouriteStoryUrls() -> [StorableStory] {
        storage.dictionaryRepresentation()
            .filter { $0.key.hasPrefix(Self.keyPrefix) }
            .compactMap { $0.value as? Data }
            .compactMap { try? decoder.decode(StorableStory.self, from: $0) }
        
    }
    
    func key(forPid pid: String) -> String {
        Self.keyPrefix + pid
    }
}

struct StorableStory: Codable {
    let url: URL
}
