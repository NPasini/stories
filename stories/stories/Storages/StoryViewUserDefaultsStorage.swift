//
//  StoryViewPersister.swift
//  stories
//
//  Created by nicolo.pasini on 04/07/25.
//

import Foundation

class StoryViewUserDefaultsStorage: UserDefaultsStorage {
    init(userDefaultsSuite: UserDefaults) {
        super.init(key: "view_story_", userDefaultsSuite: userDefaultsSuite)
    }
}
