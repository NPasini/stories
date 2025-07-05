//
//  UserDefaultsStorage.swift
//  stories
//
//  Created by nicolo.pasini on 05/07/25.
//

import Foundation

protocol LocalPersisterProtocol {
    func addStory(_ story: Story)
    func removeStory(_ story: Story)
    func isStoryAdded(_ story: Story) -> Bool
}

class UserDefaultsStorage {
    private let keyPrefix: String
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    private let storage: UserDefaults
    
    init(key: String, userDefaultsSuite: UserDefaults) {
        keyPrefix = key
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        storage = userDefaultsSuite
    }
}

extension UserDefaultsStorage: LocalPersisterProtocol {
    func addStory(_ story: Story) {
        let storableStory = StorableStory(id: story.id)
        if let data = try? encoder.encode(storableStory) {
            storage.set(data, forKey: key(forId: story.id))
        }
    }
    
    func removeStory(_ story: Story) {
        storage.removeObject(forKey: key(forId: story.id))
    }
    
    func isStoryAdded(_ story: Story) -> Bool {
        getStoredStoryIds().contains { $0 == story.id }
    }
}

private extension UserDefaultsStorage {
    func getStoredStoryIds() -> [Int] {
        storage.dictionaryRepresentation()
            .filter { $0.key.hasPrefix(keyPrefix) }
            .compactMap { $0.value as? Data }
            .compactMap { try? decoder.decode(StorableStory.self, from: $0) }
            .map { $0.id }
    }
    
    func key(forId id: Int) -> String {
        keyPrefix + "\(id)"
    }
}
